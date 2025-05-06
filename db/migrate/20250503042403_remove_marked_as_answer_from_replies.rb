class RemoveMarkedAsAnswerFromReplies < ActiveRecord::Migration[8.0]
  def change
    remove_column :replies, :marked_as_answer, :boolean
  end
end
