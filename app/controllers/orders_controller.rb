class OrdersController < ApplicationController
  layout :set_layout

  def index
    @orders = Order.all
  end

  def new
    # binding.pry
    @product = Product.find(params[:product_id])
    @order = @product.orders.build
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to checkout_create_path(@order.product_id)
    else
      flash[:errors] = @order.errors.full_messages
      redirect_to orders_path
    end
  end

  private

  def set_layout
    current_user.role == "admin" ? "application" : "merchant"
  end

  def order_params
    params.require(:order).permit(:quantity, :total_price, :customer_id, :product_id)
  end
end
