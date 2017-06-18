class Coupon < ApplicationRecord
  has_many :coupon_orders, dependent: :destroy

  validates :code, :percent, presence: true
  validates :percent, numericality: {only_integer: true, minimum: 1, maximum: 100}
end
