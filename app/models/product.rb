class Product < ApplicationRecord
  has_many :orders,  dependent: :destroy


  after_create do 
    product = Stripe::Product.create(name: name)
    price = Stripe::Price.create(product: product,unit_amount: self.price, currency: "usd")
    update(stripe_product_id: product.id)
  end
end
