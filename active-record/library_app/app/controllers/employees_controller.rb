# app/controllers/employees_controller.rb
class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  def index
    @employees = Employee.all
  end

  def show
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to @employee, notice: 'Employee was successfully created.'
    else
      render :new
    end
  end

  # GET /employees/1/edit
  def edit
  end

  # PATCH/PUT /employees/1
  def update
    if @employee.update(employee_params)
      redirect_to @employee, notice: 'Employee was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /employees/1
  def destroy
    @employee.destroy
    redirect_to employees_url, notice: 'Employee was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_employee
    @employee = Employee.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def employee_params
    params.require(:employee).permit(:name, :position)
  end
end
