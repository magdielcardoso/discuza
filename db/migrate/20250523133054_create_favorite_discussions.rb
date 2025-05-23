class CreateFavoriteDiscussions < ActiveRecord::Migration[8.0]
  def change
    create_table :favorite_discussions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :discussion, null: false, foreign_key: true

      t.timestamps
    end
  end
end
