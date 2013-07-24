class AddNameToConsumableObjects < ActiveRecord::Migration
  def change
    add_column :consumable_objects, :name, :string
  end
end
