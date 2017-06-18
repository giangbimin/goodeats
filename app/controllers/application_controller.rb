class ApplicationController < ActionController::Base
  include CookiesHelper
  protect_from_forgery with: :exception
  before_action :orders_count

  private

  def orders_count
    @orders_count = current_orders.count
  end
end
