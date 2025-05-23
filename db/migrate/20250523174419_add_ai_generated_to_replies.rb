class AddAiGeneratedToReplies < ActiveRecord::Migration[8.0]
  def change
    add_column :replies, :ai_generated, :boolean, default: false, null: false
    add_index :replies, :ai_generated
  end
end
