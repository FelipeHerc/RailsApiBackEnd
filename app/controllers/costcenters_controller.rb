class CostcentersController < ApplicationController
  before_action :set_costcenter, only: [:show, :update, :destroy]

  # GET /costcenters
  def index
    @costcenters = Costcenter.all

    render json: @costcenters
  end

  # GET /costcenters/1
  def show
    render json: @costcenter
  end

  # POST /costcenters
  def create
    @costcenter = Costcenter.new(costcenter_params)

    if @costcenter.save
      render json: @costcenter, status: :created, location: @costcenter
    else
      render json: @costcenter.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /costcenters/1
  def update
    if @costcenter.update(costcenter_params)
      render json: @costcenter
    else
      render json: @costcenter.errors, status: :unprocessable_entity
    end
  end

  # DELETE /costcenters/1
  def destroy
    @costcenter.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_costcenter
      @costcenter = Costcenter.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def costcenter_params
      params.fetch(:costcenter, {})
    end
end
