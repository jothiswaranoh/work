# app/controllers/parts_controller.rb
class PartsController < ApplicationController
  before_action :set_part, only: [:show, :edit, :update, :destroy]

  # GET /parts
  def index
    @parts = Part.all
  end

  # GET /parts/1
  def show
  end

  # GET /parts/new
  def new
    @part = Part.new
  end

  # POST /parts
  def create
    @part = Part.new(part_params)

    if @part.save
      redirect_to @part, notice: 'Part was successfully created.'
    else
      render :new
    end
  end

  # GET /parts/1/edit
  def edit
  end

  # PATCH/PUT /parts/1
  def update
    if @part.update(part_params)
      redirect_to @part, notice: 'Part was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /parts/1
  def destroy
    @part.destroy
    redirect_to parts_url, notice: 'Part was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_part
    @part = Part.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def part_params
    params.require(:part).permit(:name, :description, :price)
  end
end
