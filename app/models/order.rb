class Order < ActiveRecord::Base
  has_many :food_orders, dependent: :destroy
  has_many :coupon_orders, dependent: :destroy
  has_many :coupons, through: :coupon_orders

  validates :address, :username, :total_money, :email, :phone, presence: true
  validates :total_money, numericality: true
  validates :email, format: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  validates :phone, numericality: true, length: {minimum: 8, maximum: 14 }
end
