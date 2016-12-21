class Order < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  enum pay_type: {
      "Check"           => 0,
      "Credit Card"     => 1,
      "Purchase Order"  => 2
  }

  # enum pay_type_hash: {
  #     "Checks"           => 0,
  #     "Credit Cards"     => 1,
  #     "Purchase Orders"  => 2
  # }

  enum de_pago: {
      "Comprobar"           => 0,
      "Tarjeta de cr&eacute;dito"     => 1,
      "Orden de compra"  => 2
  }

  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: pay_types.keys

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  def payment_type
    I18n.t()
  end
end
