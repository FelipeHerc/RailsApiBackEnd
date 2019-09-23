class AccessesController < ApplicationController
  before_action :set_access, only: [:show, :update, :destroy]

  # GET /accesses
  def index
    @accesses = Access.all

    render json: @accesses
  end

  # GET /accesses/1
  def show
    render json: @access
  end

  # POST /accesses
  def create
    @access = Access.new(access_params)

    if @access.save
      render json: @access, status: :created, location: @access
    else
      render json: @access.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /accesses/1
  def update
    if @access.update(access_params)
      render json: @access
    else
      render json: @access.errors, status: :unprocessable_entity
    end
  end

  # DELETE /accesses/1
  def destroy
    @access.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_access
      @access = Access.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def access_params
      params.fetch(:access, {})
    end
end
