class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:coupon]

  def add
    add_to_orders(params[:id])
    respond_to :js
  end

  def remove
    remove_from_orders(params[:id])
    respond_to :js
  end

  def coupon
    coupon = Coupon.where(code: params[:code]).first
    percent = coupon ? coupon.percent : 0
    render json: { success: coupon != nil, percent: percent }
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      create_food_orders
      create_coupon_orders
    end
    clear_orders if @order.persisted?
    respond_to :js
  end

  def success
  end

  def index
    service = ShowOrderService.new(current_orders)
    @foods = service.foods
    @total = service.total
    @title = @total > 0 ? 'Create order' : 'You have no orders'
  end

  private

  def order_params
    params.require(:order).permit(:username, :phone, :email, :address, :total_money)
  end

  def create_food_orders
    params[:id].zip(params[:quantity]).each do |id, quantity|
      @order.food_orders.create(food_id: id, quantity: quantity)
    end
  end

  def create_coupon_orders
    @order.coupon_orders.create(coupon_id: params[:coupon_id]) if params[:coupon_id]
  end
end
