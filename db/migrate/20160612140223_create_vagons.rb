class CreateVagons < ActiveRecord::Migration
  def change
    create_table :vagons do |t|
      t.references :train, index: true, foreign_key: true
      t.integer :type_id
      t.integer :top_seats
      t.integer :bottom_seats
    end
  end
end
