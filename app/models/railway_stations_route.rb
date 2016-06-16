class RailwayStationsRoute < ActiveRecord::Base
  belongs_to :railway_station
  belongs_to :route

  validates :railway_station_id, uniqueness: { scope: :route_id }
  # validates :position, uniqueness: { scope: :route_id }

  default_scope { order(:position) }

  # before_save :set_auto_position

  private

  # def set_auto_position
  #   self.position = (RailwayStationsRoute.where(route: route).order(:position).last.position.to_i rescue 0) + 1
  # end

end
