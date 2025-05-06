class ReactionsController < ApplicationController
  include ActionView::RecordIdentifier

  before_action :authenticate_user!
  before_action :set_reactable

  # POST /discussions/:discussion_id/reactions/toggle
  # POST /replies/:reply_id/reactions/toggle  (Not implemented yet)
  def toggle
    emoji = params[:emoji]
    existing_reaction = @reactable.reactions.find_by(user: current_user, emoji: emoji)

    if existing_reaction
      existing_reaction.destroy
    else
      @reactable.reactions.create(user: current_user, emoji: emoji)
    end

    # Reload reactable with reactions for accurate counts/state in the partial
    @reactable.reload
    
    # Calculate data needed for the partial
    reaction_data = prepare_reaction_data(@reactable)

    render turbo_stream: turbo_stream.replace(
      dom_id(@reactable, "reactions"), # Target ID like "discussion_1_reactions"
      partial: "reactions/reactions",
      locals: { 
        reactable: @reactable,
        reaction_counts: reaction_data[:counts],
        current_user_reactions: reaction_data[:user_reactions] 
      }
    )
  end

  private

  def set_reactable
    # Find the parent resource (Discussion or Reply) based on params
    if params[:discussion_id]
      @reactable = Discussion.find(params[:discussion_id])
    # elsif params[:reply_id] # Add this when implementing for replies
    #   @reactable = Reply.find(params[:reply_id])
    else
      # Handle error: Unknown reactable type
      head :not_found
    end
  end
  
  # Helper to prepare data for the partial (can be moved to a helper module)
  def prepare_reaction_data(reactable)
    {
      counts: reactable.reactions.group(:emoji).count,
      user_reactions: current_user.reactions.where(reactable: reactable).pluck(:emoji)
    }
  end
end
