# app/controllers/assemblies_controller.rb
class AssembliesController < ApplicationController
  before_action :set_assembly, only: [:show, :edit, :update, :destroy]

  # GET /assemblies
  def index
    @assemblies = Assembly.all
  end

  # GET /assemblies/1
  def show
  end

  # GET /assemblies/new
  def new
    @assembly = Assembly.new
  end

  # POST /assemblies
  def create
    @assembly = Assembly.new(assembly_params)

    if @assembly.save
      redirect_to @assembly, notice: 'Assembly was successfully created.'
    else
      render :new
    end
  end

  # GET /assemblies/1/edit
  def edit
  end

  # PATCH/PUT /assemblies/1
  def update
    if @assembly.update(assembly_params)
      redirect_to @assembly, notice: 'Assembly was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /assemblies/1
  def destroy
    @assembly.destroy
    redirect_to assemblies_url, notice: 'Assembly was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_assembly
    @assembly = Assembly.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def assembly_params
    params.require(:assembly).permit(:name)
  end
end
