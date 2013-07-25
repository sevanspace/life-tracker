class AddConsumableObjectRefToConsumedUnits < ActiveRecord::Migration
  def change
    add_reference :consumed_units, :consumable_object, index: true
  end
end
