class AddFromHeadToTrains < ActiveRecord::Migration
  def change
    add_column :trains, :from_head, :boolean
  end
end
