class HomeController < ApplicationController
    def index
        # Busca discussões recentes, incluindo autor e conteúdo rich_text para eficiência
        @discussions = Discussion.includes(:user).with_rich_text_content.order(created_at: :desc)
        # @tags = ... (Placeholder para buscar tags reais depois)
        # @top_discussions = ... (Placeholder para buscar discussões mais votadas depois)
    end
end
