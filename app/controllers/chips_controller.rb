class ChipsController < ApplicationController
  before_action :set_chip, only: [:show, :update, :destroy]

  # GET /chips
  def index
    @chips = Chip.all

    render json: @chips, include: [:stat]
  end

  # GET /chips/1
  def show
    render json: @chip, include: [:stat]
  end

  # POST /chips
  def create
    @chip = Chip.new(chip_params)

    if @chip.save
      @equip = Equip.new(:chip_id => @chip.id)
      if @equip.save
        render json: [@chip, @equip], status: :created, location: @chip, root: true
      else
        raise ActiveRecord::Rollback
        render json: @equip.errors, status: :unprocessable_entity
      end
    else
      render json: @chip.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /chips/1
  def update
    if @chip.update(chip_params)
      render json: @chip
    else
      render json: @chip.errors, status: :unprocessable_entity
    end
  end

  # DELETE /chips/1
  def destroy
    @chip.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chip
      @chip = Chip.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def chip_params
      params.require(:chip).permit(:stat_id, :operator, :ddd, :phoneNumber, :value)
    end
end
