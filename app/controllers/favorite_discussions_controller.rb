class FavoriteDiscussionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_discussion

  def create
    @favorite_discussion = @discussion.favorite_discussions.new(user: current_user)

    if @favorite_discussion.save
      # Respond successfully, perhaps with a redirect or Turbo Stream update
      redirect_to @discussion, notice: "Discussion favorited!" # Or use Turbo Streams
    else
      # Handle error, perhaps with a redirect and an alert
      redirect_to @discussion, alert: "Could not favorite discussion: #{@favorite_discussion.errors.full_messages.join(", ")}" # Or use Turbo Streams
    end
  end

  def destroy
    @favorite_discussion = @discussion.favorite_discussions.find_by(user: current_user)

    if @favorite_discussion&.destroy
      # Respond successfully
      redirect_to @discussion, notice: "Discussion unfavorited!" # Or use Turbo Streams
    else
      # Handle error or if favorite not found
      redirect_to @discussion, alert: "Could not unfavorite discussion." # Or use Turbo Streams
    end
  end

  private

  def set_discussion
    @discussion = Discussion.find(params[:id]) # Assuming id is passed for the discussion
  end
end
