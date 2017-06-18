class RatingsController < ApplicationController
  before_action :find_food
  def create
    @rating = @food.ratings.new(rating_params)
    if @rating.save
      respond_to :js
    end
  end

  private

  def find_food
    @food = Food.find(params[:food_id])
  end

  def rating_params
    params.require(:rating).permit(:score, :username, :comment)
  end
end
