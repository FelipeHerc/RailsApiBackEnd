# frozen_string_literal: true

class OwnersController < ApplicationController
  acts_as_token_authentication_handler_for User
  before_action :set_owner, only: %i[show update destroy]

  # GET /owners
  def index
    @owners = Owner.all

    render json: @owners, include: %i[company sector]
  end

  # GET /owners/1
  def show
    render json: @owner, include: %i[company sector]
  end

  # POST /owners
  def create
    @owner = Owner.new(
      name: owner_params[:name],
      cpf: owner_params[:cpf],
      email: owner_params[:email],
      sector_id: owner_params[:sector_id],
      company_id: owner_params[:company_id],
      city_id: owner_params[:city_id],
      access: Access.find(params[:access])
    )

    if @owner.save
      render json: @owner, status: :created, location: @owner
    else
      render json: @owner.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /owners/1
  def update
    if @owner.update(owner_params)
      render json: @owner
    else
      render json: @owner.errors, status: :unprocessable_entity
    end
  end

  # DELETE /owners/1
  def destroy
    @owner.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_owner
    @owner = Owner.find_by(id: params[:id])
    render json: not_found_message, status: :not_found if @owner.nil?
  end

  # Only allow a trusted parameter "white list" through.
  def owner_params
    params.require(:owner).permit(:name, :cpf, :sector, :company, :email, :sector_id, :company_id, :city_id, :aaa)
  end

  def not_found_message
    {
      "data": [
        "message": "Registro não encontrado"
      ]
    }
  end
end
