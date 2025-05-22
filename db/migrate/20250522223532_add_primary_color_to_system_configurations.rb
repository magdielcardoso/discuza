class AddPrimaryColorToSystemConfigurations < ActiveRecord::Migration[8.0]
  def change
    add_column :system_configurations, :primary_color, :string
  end
end
