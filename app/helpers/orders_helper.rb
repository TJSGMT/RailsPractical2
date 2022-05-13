module OrdersHelper
 
  def total_price(order)
    order.quantity.to_i * order.product&.price.to_i
  end
end
