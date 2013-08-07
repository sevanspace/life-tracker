class AddShowToDashboards < ActiveRecord::Migration
  def change
    add_column :dashboards, :show, :boolean
  end
end
