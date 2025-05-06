class CreateAnswerMarks < ActiveRecord::Migration[8.0]
  def change
    create_table :answer_marks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :reply, null: false, foreign_key: true

      t.timestamps
    end
    # Garante que um usuário só pode marcar uma resposta uma vez
    add_index :answer_marks, [:user_id, :reply_id], unique: true
  end
end
