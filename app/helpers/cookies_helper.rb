require 'json'

module CookiesHelper
  def current_orders
    cookies[:orders] ? decode_orders : []
  end

  def add_to_orders(id)
    cookies[:orders] = encode_orders(current_orders << id)
  end

  def remove_from_orders(id)
    new_orders = current_orders
    new_orders.delete("#{id}")
    cookies[:orders] = encode_orders(new_orders)
  end

  private

  def decode_orders
    cookies[:orders].split(", ")
  end

  def encode_orders(orders)
    orders.reduce("") {
      |result, id| result + "#{id}, "
    }
  end
end
