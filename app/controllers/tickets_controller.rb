class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: [:show, :destroy]

  def create
    @ticket = current_user.tickets.new(ticket_params)

    if @ticket.save
      redirect_to @ticket, notice: 'Thank you!'
    else
      render text: 'Something go wrong while payment'
    end
  end

  def show
  end

  def index
    @tickets = current_user.tickets
  end

  def destroy
    @ticket.destroy
    redirect_to root_url, notice: 'Ticket deleted.'
  end

  private

  def set_ticket
    @ticket = current_user.tickets.find(params[:id])
  end

  def ticket_params
    params.permit(:fio, :passport, :railway_stations_route_id, :start_station_id, :end_station_id, :train_id)
  end
end
