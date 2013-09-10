class RemoveActivityIdFromActivity < ActiveRecord::Migration
  def change
    remove_column :activities, :activity_id, :integer
  end
end
