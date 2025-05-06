class AddClosureFieldsToDiscussions < ActiveRecord::Migration[8.0]
  def change
    add_column :discussions, :closure_status, :string
    add_column :discussions, :closure_reason, :text
  end
end
