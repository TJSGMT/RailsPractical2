class ProductsController < ApplicationController
before_action :find_product ,only: [:edit ,:show ,:update ,:destroy]
  
  def index
    @products = Product.all
  end

  def create
    @product = Product.create(product_params)
    if @product.valid?
      redirect_to products_path
    else
      flash[:errors] = @product.errors.full_messages
      redirect_to products_path
    end
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def update
    if @product.update(product_params)
      flash[:errors] = "Successfull!"
      redirect_to products_path
    else
      flash[:errors] = @product.errors.full_messages
      redirect_to edit_product_path
    end 
  end

  def show
  end

  def destroy
    @product.destroy
    redirect_to product_path
  end
  
  def find_product
    @product = Product.find(params[:id])
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price)
  end
end
