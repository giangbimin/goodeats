class FoodOrder < ApplicationRecord
  belongs_to :food
  belongs_to :order

  validates :food_id, :order_id, :quantity, presence: true
  validates :quantity, numericality: {only_integer: true, greater_than_or_equal_to: 1}
end
