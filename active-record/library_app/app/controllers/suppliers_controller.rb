# app/controllers/suppliers_controller.rb
class SuppliersController < ApplicationController
  before_action :set_supplier, only: [:show, :edit, :update, :destroy]

  # GET /suppliers
  def index
    @suppliers = Supplier.all
  end

  # GET /suppliers/1
  def show
    @suppliers = @supplier.Supplier(params[:id])
  end

  # GET /suppliers/new
  def new
    @supplier = Supplier.new
  end

  # POST /suppliers
  def create
    @supplier = Supplier.new(supplier_params)

    if @supplier.save
      redirect_to @supplier, notice: 'Supplier was successfully created.'
    else
      render :new
    end
  end

  # GET /suppliers/1/edit
  def edit
  end

  # PATCH/PUT /suppliers/1
  def update
    if @supplier.update(supplier_params)
      redirect_to @supplier, notice: 'Supplier was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /suppliers/1
  def destroy
    @supplier.destroy
    redirect_to suppliers_url, notice: 'Supplier was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_supplier
    @supplier = Supplier.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def supplier_params
    params.require(:supplier).permit(:name)
  end
end
