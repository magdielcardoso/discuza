module DiscussionsHelper
  # OpenGraph image generation using TailGraph API
  def discussion_og_image_url(discussion)
    og_params = {
      fontFamily: "Inter",
      title: discussion.title,
      titleTailwind: "font-bold text-5xl text-gray-900 leading-tight px-8",
      text: "Por #{discussion.user.name} • #{discussion.category.name} • #{time_ago_in_words(discussion.created_at)} atrás",
      textTailwind: "text-xl text-gray-600 mt-6 px-8",
      logoUrl: "", # Add your logo URL here if needed
      logoTailwind: "w-12 h-12 mb-4",
      bgTailwind: "bg-gradient-to-br from-blue-50 via-white to-purple-50 p-8",
      footer: "DevConnect Community",
      footerTailwind: "text-blue-600 font-semibold text-lg mt-8 px-8",
      refresh: "1"
    }

    # Convert params to URL query string
    query_string = og_params.map do |key, value|
      "#{key}=#{ERB::Util.url_encode(value.to_s)}"
    end.join("&")

    "https://og.tailgraph.com/og?#{query_string}"
  end

  # Generate OpenGraph description from discussion content
  def discussion_og_description(discussion)
    content = discussion.content.to_plain_text.strip
    truncate(content, length: 160, separator: " ")
  end
end
