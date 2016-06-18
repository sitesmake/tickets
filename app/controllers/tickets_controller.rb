class TicketsController < ApplicationController
  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      redirect_to @ticket, notice: 'Thank you!'
    else
      render text: 'Something go wrong while payment'
    end
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  private

  def ticket_params
    params.permit(:fio, :passport, :railway_stations_route_id, :start_station_id, :end_station_id, :train_id)
  end
end
