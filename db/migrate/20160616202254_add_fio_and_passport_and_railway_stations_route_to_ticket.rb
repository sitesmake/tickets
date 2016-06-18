class AddFioAndPassportAndRailwayStationsRouteToTicket < ActiveRecord::Migration
  def change
    add_column :tickets, :fio, :string
    add_column :tickets, :passport, :string
    add_reference :tickets, :railway_stations_route, index: true, foreign_key: true
  end
end
