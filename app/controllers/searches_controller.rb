class SearchesController < ApplicationController
  def show
  end

  def result
    @start_station = RailwayStation.find(params[:start_station][:id])
    @end_station = RailwayStation.find(params[:end_station][:id])
    @routes = Route.ab_search(@start_station, @end_station)
  end
end