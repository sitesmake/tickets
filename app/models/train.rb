class Train < ActiveRecord::Base
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route

  has_many :tickets

  has_many :vagons

  def count_seats(vagon_type, seats_type)
    self.vagons.where(type: vagon_type).sum(seats_type)
  end
end
