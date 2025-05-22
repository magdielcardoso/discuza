class CreateSystemConfigurations < ActiveRecord::Migration[8.0]
  def change
    create_table :system_configurations do |t|
      t.string :site_name
      t.text :site_description
      t.string :contact_email

      t.timestamps
    end
  end
end
