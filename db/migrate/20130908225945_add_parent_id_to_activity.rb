class AddParentIdToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :parent_id, :integer
  end
end
