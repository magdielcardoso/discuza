include ActionView::RecordIdentifier

class VotesController < ApplicationController
  def create
    @discussion = Discussion.find(params[:discussion_id])
    value = params[:value].to_i
    return head :unprocessable_entity unless [ -1, 1 ].include?(value)

    @vote = Vote.find_or_initialize_by(user: current_user, votable: @discussion)
    @vote.value = value
    if @vote.save
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace(dom_id(@discussion, :votes), partial: "discussions/votes", locals: { discussion: @discussion }) }
        format.html { redirect_to root_path, notice: "Voto registrado." }
      end
    else
      respond_to do |format|
        format.turbo_stream { head :unprocessable_entity }
        format.html { redirect_to root_path, alert: @vote.errors.full_messages.to_sentence }
      end
    end
  end

  def destroy
    @discussion = Discussion.find(params[:discussion_id])
    @vote = Vote.find_by(user: current_user, votable: @discussion)
    @vote&.destroy
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace(dom_id(@discussion, :votes), partial: "discussions/votes", locals: { discussion: @discussion }) }
      format.html { redirect_to root_path, notice: "Voto removido." }
    end
  end
end
