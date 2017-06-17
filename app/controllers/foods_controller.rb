class FoodsController < ApplicationController
  before_action :find_food
  def show
    @food.increase_views_count
  end

  private

  def find_food
    @food = Food.find(params[:id])
  end
end
