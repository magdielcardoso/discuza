class HomeController < ApplicationController
    def index
        # Busca discussões recentes, incluindo autor e conteúdo rich_text para eficiência
        @discussions = Discussion.includes(:user).with_rich_text_content.order(pinned: :desc, updated_at: :desc)
        @categories = Category.all
        @recommended_discussions = Discussion.order(created_at: :desc).limit(4)
        # Busca as discussões mais votadas (upvotes)
        @top_discussions = Discussion
          .left_joins(:votes)
          .select("discussions.*, COALESCE(SUM(CASE WHEN votes.value = 1 THEN 1 ELSE 0 END), 0) AS upvotes_count")
          .group("discussions.id")
          .order("upvotes_count DESC")
          .limit(4)
          .includes(votes: :user)
      # @tags = ... (Placeholder para buscar tags reais depois)
    end
end
