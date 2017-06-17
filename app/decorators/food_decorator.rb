include ActionView::Helpers::NumberHelper
include ApplicationHelper

class FoodDecorator < Draper::Decorator
  delegate_all

  def order_quantity(quantity)
    @quantity = quantity
  end

  def quantity
    @quantity ||= 0
  end

  def price
    format_price(object.price)
  end

  def price_amount
    object.price
  end

  def total
    format_price(quantity * object.price)
  end

  def total_amount
    quantity * object.price
  end
end
