# frozen_string_literal: true

class NotebooksController < ApplicationController
  before_action :set_notebook, only: %i[show update destroy], :authenticate_user!

  # GET /notebooks
  def index
    @notebooks = Notebook.all

    render json: @notebooks, include: [:stat]
  end

  # GET /notebooks/1
  def show
    render json: @notebook, include: [:stat]
  end

  # POST /notebooks
  def create
    @notebook = Notebook.new(notebook_params)

    if @notebook.save
      @equip = Equip.new(notebook_id: @notebook.id)

      if @equip.save
        render json: [@notebook, @equip], status: :created, location: @notebook, root: true
      else
        raise ActiveRecord::Rollback
        render json: @equip.errors, status: :unprocessable_entity
      end
    else
      render json: @notebook.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notebooks/1
  def update
    if @notebook.update(notebook_params)
      render json: @notebook
    else
      render json: @notebook.errors, status: :unprocessable_entity
    end
  end

  # DELETE /notebooks/1
  def destroy
    @notebook.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_notebook
    @notebook = Notebook.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def notebook_params
    params.require(:notebook).permit(:stat_id, :brand, :model, :serialNumber)
  end
end
