class AddAiNameToSystemConfigurations < ActiveRecord::Migration[8.0]
  def change
    add_column :system_configurations, :ai_name, :string, default: "Discuza AI", null: false
  end
end
