# frozen_string_literal: true

class PossesionsController < ApplicationController
  before_action :set_possesion, only: %i[show update destroy], :authenticate_user!

  # GET /possesions
  def index
    @possesions = Possesion.all

    render json: @possesions, include: %i[owner equip]
  end

  # GET /possesions/1
  def show
    render json: @possesion, include: %i[owner equip]
  end

  # POST /possesions
  def create
    @possesion = Possesion.new(possesion_params)

    if @possesion.save
      render json: @possesion, status: :created, location: @possesion
    else
      render json: @possesion.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /possesions/1
  def update
    if @possesion.update(possesion_params)
      render json: @possesion
    else
      render json: @possesion.errors, status: :unprocessable_entity
    end
  end

  # DELETE /possesions/1
  def destroy
    @possesion.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_possesion
    @possesion = Possesion.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def possesion_params
    params.require(:possesion).permit(:owner_id, :equip_id)
  end
end
