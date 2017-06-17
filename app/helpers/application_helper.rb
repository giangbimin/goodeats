module ApplicationHelper
  def format_price(amount)
    number_to_currency(amount, unit: 'VND', separator: '.', delimiter: '.', format: '%n %u')
  end
end
