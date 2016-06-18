class Route < ActiveRecord::Base
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes

  has_many :trains

  validates :title, presence: true

  def self.ab_search(start_station, end_station)
    start_routes = RailwayStationsRoute.where(railway_station_id: start_station).pluck(:route_id).uniq
    final_routes = RailwayStationsRoute.where(railway_station_id: end_station, route_id: start_routes)
    Route.where(id: final_routes.pluck(:route_id))
  end

end
