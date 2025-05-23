class AnalyzeDiscussionJob < ApplicationJob
  queue_as :default

  # Retry configuration for AI service failures
  retry_on StandardError, wait: :polynomially_longer, attempts: 3
  discard_on ActiveJob::DeserializationError

  def perform(discussion_id)
    @discussion = Discussion.find(discussion_id)
    @prompts = load_ai_prompts

    # Skip if discussion already has AI-generated reply
    return if already_has_ai_reply?

    # Find similar discussions with marked answers
    similar_discussions = find_similar_discussions
    return if similar_discussions.empty?

    # Analyze similarity using AI
    analysis_result = analyze_with_ai(similar_discussions)
    return unless should_generate_reply?(analysis_result)

    # Generate and create AI reply
    generate_ai_reply(analysis_result)

  rescue => e
    Rails.logger.error "AnalyzeDiscussionJob Error for discussion #{@discussion.id}: #{e.message}"
    raise # Will trigger retry
  end

  private

  def load_ai_prompts
    @prompts ||= YAML.load_file(Rails.root.join("lib/ai_prompts/discussion_reply.yml"))
  end

  def already_has_ai_reply?
    @discussion.replies.where(ai_generated: true).exists?
  end

  def find_similar_discussions
    # Find discussions with marked answers, excluding current discussion
    Discussion.joins(replies: :answer_marks)
             .where.not(id: @discussion.id)
             .includes(:replies, :user, :category)
             .limit(@prompts["settings"]["max_previous_discussions"])
             .distinct
             .to_a
  end

  def analyze_with_ai(similar_discussions)
    # Prepare data for AI analysis
    previous_discussions_text = format_discussions_for_ai(similar_discussions)

    prompt = @prompts["analysis_prompt"]
                .gsub("{new_title}", @discussion.title)
                .gsub("{new_content}", extract_content_text(@discussion.content))
                .gsub("{category_name}", @discussion.category.name)
                .gsub("{previous_discussions}", previous_discussions_text)

    # Combine system prompt with analysis prompt
    full_prompt = "#{@prompts['system_prompts']['analysis_system']}\n\n#{prompt}"

    # Get AI analysis using correct RubyLLM syntax
    chat = RubyLLM.chat
    response = chat.ask(full_prompt)

    # Parse JSON response
    JSON.parse(response.content)
  rescue JSON::ParserError => e
    Rails.logger.error "Failed to parse AI analysis response: #{e.message}"
    { "has_similar_discussions" => false }
  end

  def should_generate_reply?(analysis_result)
    analysis_result["has_similar_discussions"] &&
      analysis_result["confidence_score"].to_f >= @prompts["settings"]["min_confidence_threshold"] &&
      analysis_result["recommended_action"] == "link_to_existing"
  end

  def generate_ai_reply(analysis_result)
    # Prepare similar discussions data for reply generation
    similar_discussions_data = format_similar_discussions_for_reply(analysis_result["similar_discussions"])

    prompt = @prompts["reply_generation_prompt"]
                .gsub("{new_title}", @discussion.title)
                .gsub("{new_content}", extract_content_text(@discussion.content))
                .gsub("{similar_discussions_data}", similar_discussions_data)

    # Combine system prompt with reply prompt
    full_prompt = "#{@prompts['system_prompts']['reply_system']}\n\n#{prompt}"

    # Generate reply content using correct RubyLLM syntax
    chat = RubyLLM.chat
    response = chat.ask(full_prompt)

    # Create AI-generated reply
    create_ai_reply(response.content.strip)
  end

  def create_ai_reply(content)
    # Find or create a system user for AI replies
    ai_user = find_or_create_ai_user

    @discussion.replies.create!(
      content: content,
      user: ai_user,
      ai_generated: true
    )

    Rails.logger.info "AI reply created for discussion #{@discussion.id}"
  end

  def find_or_create_ai_user
    ai_name = SystemConfiguration.instance.ai_name

    User.find_or_create_by(email: "ai@devconnect.com") do |user|
      user.name = ai_name
      user.password = SecureRandom.hex(32)
    end
  end

  def format_discussions_for_ai(discussions)
    discussions.map do |discussion|
      answered_reply = discussion.replies.joins(:answer_marks).first

      {
        id: discussion.id,
        title: discussion.title,
        content: extract_content_text(discussion.content),
        category: discussion.category.name,
        answer: answered_reply ? extract_content_text(answered_reply.content) : "No answer available"
      }
    end.to_json
  end

  def format_similar_discussions_for_reply(similar_discussions)
    similar_discussions.map do |disc|
      discussion_path = Rails.application.routes.url_helpers.discussion_path(disc["id"])

      "- **[#{disc['title']}](#{discussion_path})**: #{disc['similarity_reason']}\n" \
      "  Resposta: #{disc['answer_snippet']}\n"
    end.join("\n")
  end

  def extract_content_text(rich_text_content)
    return "" if rich_text_content.blank?

    # Extract plain text from ActionText rich content
    if rich_text_content.respond_to?(:to_plain_text)
      rich_text_content.to_plain_text
    else
      rich_text_content.to_s
    end
  end
end
