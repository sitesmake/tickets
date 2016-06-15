class AddNumberToVagons < ActiveRecord::Migration
  def change
    add_column :vagons, :number, :integer
  end
end
