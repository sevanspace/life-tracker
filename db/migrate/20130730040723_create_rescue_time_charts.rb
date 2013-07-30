class CreateRescueTimeCharts < ActiveRecord::Migration
  def change
    create_table :rescue_time_charts do |t|
      t.string :title
      t.string :key
      t.boolean :show
      t.integer :width
      t.integer :height
      t.text :script

      t.timestamps
    end
  end
end
