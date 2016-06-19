class SearchesController < ApplicationController
  def show
    @stations = RailwayStation.all
  end

  def result
    @start_station = RailwayStation.find(params[:start_station])
    @end_station = RailwayStation.find(params[:end_station])
    @routes = Route.ab_search(@start_station, @end_station)
  end
end