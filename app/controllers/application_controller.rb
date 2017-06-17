class ApplicationController < ActionController::Base
  include CookiesHelper
  protect_from_forgery with: :exception
  before_action :get_orders_count

  private

  def get_orders_count
    @orders_count = current_orders.count
  end
end
