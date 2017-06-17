class OrdersController < ApplicationController
  def add
    add_to_orders(params[:id])
    @orders_count = current_orders.count
    respond_to :js
  end

  def remove
    remove_from_orders(params[:id])
    redirect_to orders_index_path
  end

  def index
    service = ShowOrderService.new(current_orders)
    @foods = service.foods
    @total = service.total
    @title = @total > 0 ? 'Create order' : 'You have no orders'
  end
end
