class Rating < ApplicationRecord
  validates :score, numericality: {only_integer: true, minimum: 0, maximum: 5}
  belongs_to :food
end
