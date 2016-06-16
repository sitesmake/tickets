class SearchesController < ApplicationController
  def show
  end

  def result
    @start_station_id = RailwayStation.find(params[:start_station][:id])
    @end_station_id = RailwayStation.find(params[:end_station][:id])
    @routes = Route.ab_search(@start_station_id, @end_station_id)
  end
end