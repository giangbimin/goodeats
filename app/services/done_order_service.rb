class DoneOrderService
  attr_reader :order, :foods, :coupon

  def initialize(order_id)
    @order = get_order(order_id)
    @foods = take_foods
    @coupon = take_coupon
    send_email
  end

  private

  def send_email
  end

  def get_order(id)
    Order.find(id)
  end

  def take_coupon
    @order.coupons.count > 0 ? @order.coupons.first : nil
  end

  def take_foods
    @order.food_orders.map { |food_order| map_to_food(food_order) }
  end

  def map_to_food(food_order)
    food = food_order.food
    food.set_quantity(food_order.quantity)
    food
  end
end
