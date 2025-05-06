class CreateDiscussions < ActiveRecord::Migration[8.0]
  def change
    create_table :discussions do |t|
      t.string :title
      t.references :user, null: false, foreign_key: true
      t.boolean :pinned
      t.boolean :closed

      t.timestamps
    end
  end
end
