class CreateDashboards < ActiveRecord::Migration
  def change
    create_table :dashboards do |t|
      t.text :display_widgets
      t.timestamps
    end
  end
end
