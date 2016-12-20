class LineItem < ActiveRecord::Base
  belongs_to :order, required: false
  belongs_to :product, required: false
  belongs_to :cart

  #attr_accessor :skip_order_validation :order_id, :product_id

  def total_price
    product.price * quantity
  end
end
