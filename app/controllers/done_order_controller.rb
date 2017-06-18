class DoneOrderController < ApplicationController
  def show
    service = DoneOrderService.new(params[:id])
    @order, @foods, @coupon = service.order, service.foods, service.coupon
end
end
