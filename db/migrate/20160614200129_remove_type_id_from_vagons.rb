class RemoveTypeIdFromVagons < ActiveRecord::Migration
  def change
    remove_column :vagons, :type_id
  end
end
