class CreateConsumedUnits < ActiveRecord::Migration
  def change
    create_table :consumed_units do |t|
      t.references :consumable_type
      t.decimal :amount, :precision => 5, :scale => 2
      t.string :unit

      t.timestamps
    end
  end
end
