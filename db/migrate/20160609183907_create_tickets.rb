class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.references :user, index: true, foreign_key: true
      t.references :train, index: true, foreign_key: true
      t.integer :start_station_id
      t.integer :end_station_id

      t.timestamps null: false
    end
  end
end
