class MenuController < ApplicationController
  def index
    @foods = Food.all
    @food = @foods.first
    default_opitions
  end

  def display
    @food = Food.find(params[:id])
    @food.increase_views_count
    respond_to :js
  end

  def sort
    @foods = Food.all
    filtering_params(seach_params).each do |key, value|
      @foods = @foods.public_send(key, value) if value.present?
    end
    respond_to :js
  end

  private

  def filtering_params(params)
    params.slice(:search_name, :by_section, :by_cuisine, :name_sort, :price_sort, :views_count_sort)
  end

  def default_opitions
    @price_sort = ['ASC', 'DESC']
    @name_sort = ['ASC', 'DESC']
    @views_count_sort = ['ASC', 'DESC']
    @by_section = @foods.pluck(:section).uniq
    @by_cuisine = @foods.pluck(:cuisine).uniq
  end

  def seach_params
    params[:search]
  end
end
