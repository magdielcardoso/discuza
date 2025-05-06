class AddClosedInfoToDiscussions < ActiveRecord::Migration[8.0]
  def change
    add_column :discussions, :closed_at, :datetime
    add_reference :discussions, :closed_by, null: true, foreign_key: { to_table: :users }
  end
end
