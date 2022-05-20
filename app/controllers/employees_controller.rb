class EmployeesController < ApplicationController
  before_action :find_employee , only:[:edit ,:show ,:update ,:destroy]
  
  def index
    @employees = Employee.all
  end
  
  def new
    @employee = Employee.new
    2.times { @employee.addresses.build }
  end
  
  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to employees_path
    else  
      redirect_to new_employee_path
    end
  end

  def edit
  end

  def show
  end

  def update
    @employee.update(employee_params)
    redirect_to employees_path
  end

  def destroy
    @employee.destroy
    redirect_to employees_path
  end

  def search
    if params[:search].present?
      @employees = Employee.where("email = ?",params[:search])
      if @employees.nil?
        flash[:notice]="Invalid email!!!" 
      end
    else
      @employees= Employee.all
    end
  end

  def employee_params
    params.require(:employee).permit(:employee_name , :email ,:password ,:gender ,{hobbies:[]},:address ,:mobile_number ,:birtd_date ,:document,addresses_attributes:[:house_name, :street_name ,:road])
  end

  def find_employee
    @employee = Employee.find(params[:id])
  end
end
