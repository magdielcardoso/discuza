class HomeController < ApplicationController
    def index
        # Build the base query for discussions - only open discussions
        discussions_query = Discussion.includes(:user, :category, :votes)
                                .with_rich_text_content
                                .where(closed: false)
                                .search_by_term(params[:search])
                                .order(pinned: :desc, updated_at: :desc)

        # Paginate the results
        @discussions = discussions_query.page(params[:page])
        @search_term = params[:search] # Store search term for the view

        @categories = Category.all
        @recommended_discussions = Discussion.where(closed: false).order(created_at: :desc).limit(4)

        # For top discussions, also apply search filter and only open discussions
        @top_discussions = Discussion.left_joins(:votes)
                            .select("discussions.*, COALESCE(SUM(CASE WHEN votes.value = 1 THEN 1 ELSE 0 END), 0) AS upvotes_count")
                            .where(closed: false)
                            .group("discussions.id")
                            .search_by_term(params[:search])
                            .order("upvotes_count DESC")
                            .limit(4)
                            .includes(votes: :user)
    end
end
