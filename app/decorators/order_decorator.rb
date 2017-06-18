class OrderDecorator < Draper::Decorator
  include ApplicationHelper
  delegate_all

  def create_time
    object.created_at.strftime('%d/%m/%Y - %I:%M%p')
  end

  def total_money
    format_price(object.total_money)
  end
end
