class AddWidgetsToDashboards < ActiveRecord::Migration
  def change
    add_column :dashboards, :widgets, :text
  end
end
