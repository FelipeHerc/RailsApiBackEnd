class CelsController < ApplicationController
  before_action :set_cel, only: [:show, :update, :destroy]

  # GET /cels
  def index
    @cels = Cel.all

    render json: @cels
  end

  # GET /cels/1
  def show
    render json: @cel
  end

  # POST /cels
  def create
    @cel = Cel.new(cel_params)

    if @cel.save
      @equip = Equip.new(:cel_id => @cel.id)

      if @equip.save
        render json: [@cel, @equip], status: :created, location: @cel, root: true
      else
        raise ActiveRecord::Rollback
        render json: @cel.errors, status: :unprocessable_entity
      end
    else
      render json: @cel.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cels/1
  def update
    if @cel.update(cel_params)
      render json: @cel
    else
      render json: @cel.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cels/1
  def destroy
    @cel.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cel
      @cel = Cel.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cel_params
      params.require(:cel).permit(:stat_id, :brand, :model, :imei1, :imei2)
    end
end
