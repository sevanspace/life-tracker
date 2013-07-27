class AddColorToConsumableTypes < ActiveRecord::Migration
  def change
    add_column :consumable_types, :color, :string, :default => "black"
  end
end
