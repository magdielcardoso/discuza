module DiscussionsHelper
  # OpenGraph image generation using TailGraph API - GitHub Style
  def discussion_og_image_url(discussion)
    # Use Rails asset helper for logo
    logo_url = ActionController::Base.helpers.asset_url("logo_dark.svg")

    # Clean metadata formatting like GitHub
    metadata = "#{discussion.user.name} em #{discussion.category.name}"

    og_params = {
      fontFamily: "Inter",
      title: discussion.title,
      titleTailwind: "font-bold text-6xl text-gray-900 leading-tight px-20 mt-4 mb-3 tracking-tight max-w-5xl",
      text: metadata,
      textTailwind: "text-2xl text-gray-600 px-20 mb-6 font-medium",
      logoUrl: logo_url,
      logoTailwind: "w-16 h-16 ml-20 mt-16 mb-10 object-contain",
      bgTailwind: "bg-gray-50 border-l-4 border-blue-600",
      footer: "\u{1F680} DevConnect Community",
      footerTailwind: "text-gray-500 text-xl px-20 absolute bottom-12 font-medium",
      refresh: Time.current.to_i.to_s
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
