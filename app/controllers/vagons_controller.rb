class VagonsController < ApplicationController
  before_action :set_vagon, only: [:show, :edit, :update, :destroy]

  def index
    @vagons = Vagon.all
  end

  def show
  end

  def new
    @vagon = Vagon.new
  end

  def edit
  end

  def create
    @vagon = Vagon.new(vagon_params)

    if @vagon.save
      redirect_to @vagon, notice: 'Vagon was successfully created.'
    else
      render :new
    end
  end

  def update
    if @vagon.update(vagon_params)
      redirect_to @vagon, notice: 'Vagon was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @vagon.destroy
    redirect_to vagons_url, notice: 'Vagon was successfully destroyed.'
  end

  private
    def set_vagon
      @vagon = Vagon.find(params[:id])
    end

    def vagon_params
      params.require(:vagon).permit(:train_id, :type_id, :top_seats, :bottom_seats)
    end
end
