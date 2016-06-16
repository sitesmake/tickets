class RailwayStation < ActiveRecord::Base
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  has_many :trains, foreign_key: :current_station_id

  scope :ordered, -> { joins(:railway_stations_routes).order("railway_stations_routes.position") }

  def update_position(route, position, arrival_time, departure_time)
    station_route = station_route(route)
    station_route.update(position: position, arrival_time: arrival_time, departure_time: departure_time)
  end

  def position_in(route)
    station_route(route).try(:position)
  end

  def arrival_time_in(route)
    station_route(route).try(:arrival_time)
  end

  def departure_time_in(route)
    station_route(route).try(:departure_time)
  end

  protected

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end
end
