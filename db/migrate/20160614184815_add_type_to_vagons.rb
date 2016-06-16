class AddTypeToVagons < ActiveRecord::Migration
  def change
    add_column :vagons, :type, :string
  end
end
