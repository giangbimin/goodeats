class DoneOrderController < ApplicationController
  def show
    service = DoneOrderService.new(params[:id])
    @order = service.order
    @foods = service.foods
    @coupon = service.coupon
end
end
