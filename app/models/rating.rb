class Rating < ApplicationRecord
  before_create :set_default
  belongs_to :food
  validates :score, presence: true, numericality: { only_integer: true, minimum: 1, maximum: 5 }

  def set_default
    self.username ||= 'Anonymous'
    self.comment ||= 'No comment'
  end
end
