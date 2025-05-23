# RubyLLM Configuration for AI-powered discussion analysis
RubyLLM.configure do |config|
  # OpenAI configuration
  config.openai_api_key = ENV.fetch("OPENAI_API_KEY", nil)
end
