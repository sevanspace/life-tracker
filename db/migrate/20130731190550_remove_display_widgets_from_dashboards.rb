class RemoveDisplayWidgetsFromDashboards < ActiveRecord::Migration
  def change
    remove_column :dashboards, :display_widgets, :string
  end
end
