class Admin::VagonsController < Admin::BaseController
  before_action :set_train, only: [:new, :create]
  before_action :set_type
  before_action :set_vagon, only: [:show, :edit, :update, :destroy]

  def index
    @vagons = type_class.all
  end

  def show
  end

  def new
    @vagon = type_class.new
  end

  def edit
  end

  def create
    @vagon = @train.vagons.new(vagon_params)

    if @vagon.save
      redirect_to [:admin, @vagon], notice: 'Vagon was successfully created.'
    else
      render :new
    end
  end

  def update
    if @vagon.update(vagon_params)
      redirect_to [:admin, @vagon], notice: 'Vagon was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @vagon.destroy
    redirect_to vagons_url, notice: 'Vagon was successfully destroyed.'
  end

  private
    def set_train
      @train = Train.find(params[:train_id])
    end

    def set_type
      @type = type
    end

    def type
      Vagon.types.include?(params[:kind]) ? params[:kind] : "Vagon"
    end

    def type_class
      type.constantize
    end

    def set_vagon
      @vagon = type_class.find(params[:id])
    end

    def vagon_params
      params.require(type.underscore.to_sym).permit(:train_id, :type, :top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats, :sitting_seats, :number)
    end
end
