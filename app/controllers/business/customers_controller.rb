class Business::CustomersController < ApplicationController
before_action :find_customer ,only: [:edit, :update  ,:delete_customer ,:show ,:preview]

  def index
    @customers = Customer.all
    if params[:customer_name].present?
      @customers = Customer.where("name = ?",params[:customer_name])
    end
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to  business_customers_path
    else
        flash[:notice] = @customer.errors.full_messages
        redirect_to  new_customer_path
    end
  end

  def edit
  end

  def show
  end
  
  def preview
  end
  
  def update
    if @customer.update(customer_params)
      flash[:errors] = "Successfull!"
      redirect_to business_customers_path
    else
      flash[:errors] = @customer.errors.full_messages
      redirect_to edit_business_customer_path
    end 
  end

  def delete_customer
    if @customer.destroy
      flash[:errors] = "Successfuly Performed delete!"
      redirect_to business_customers_path
    else  
      flash[:errors] = @product.errors.full_messages
      redirect_to new_business_customers_path
    end 
  end

  def find_customer
    @customer = Customer.find(params[:id])
  end    
  
  private
  def customer_params
    params.require(:customer).permit(:name ,:contact)
  end  
end
