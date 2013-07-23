class CreateConsumableObjects < ActiveRecord::Migration
  def change
    create_table :consumable_objects do |t|
      t.references :consumable_type
      t.decimal :amount, :precision => 5, :scale => 2
      t.string :unit

      t.timestamps
    end
  end
end
