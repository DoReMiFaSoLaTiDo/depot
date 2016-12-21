module ApplicationHelper

  def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes["style"] = "display: none"
    end
    content_tag("div", attributes, &block)
  end

  def currency_converter(loc, price)
    exchange_rate =  { "ES_es" => 0.96, "en" => 1 }
    if exchange_rate.include? loc
      price = amount * exchange_rate[loc]
    else
      price
    end

  end

  def order_pay_type_options
    Order.pay_type_hash.map do |k,v|
      [t(k, scope: :pay_type), v]
    end
  end

end

