class CreateConsumableTypes < ActiveRecord::Migration
  def change
    create_table :consumable_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
