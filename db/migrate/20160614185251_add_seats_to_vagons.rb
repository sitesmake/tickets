class AddSeatsToVagons < ActiveRecord::Migration
  def change
    add_column :vagons, :side_top_seats, :integer
    add_column :vagons, :side_bottom_seats, :integer
    add_column :vagons, :sitting_seats, :integer
  end
end
