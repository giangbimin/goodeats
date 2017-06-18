class CreateOrderService
  def initialize(params)
    @params = params
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      create_food_orders
      create_coupon_orders
    end
    @order
  end

  private

  def create_food_orders
    @params[:id].zip(@params[:quantity]).each do |id, quantity|
      @order.food_orders.create(food_id: id, quantity: quantity)
    end
  end

  def create_coupon_orders
    @order.coupon_orders.create(coupon_id: @params[:coupon_id]) if @params[:coupon_id]
  end

  def order_params
    @params.require(:order).permit(:username, :phone, :email, :address, :total_money)
  end
end
