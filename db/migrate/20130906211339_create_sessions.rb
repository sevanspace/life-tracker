class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.timestamp :begin
      t.timestamp :end
      t.references :activity, index: true
    end
  end
end
