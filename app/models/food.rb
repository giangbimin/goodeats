class Food < ApplicationRecord
  validates :name, :description, :image_url, :price, :section, :cuisine, :views_count, presence: true
  validates :price, numericality: true

  has_many :ratings, dependent: :destroy
  has_many :food_orders, dependent: :destroy

  scope :by_section, -> (section) { where section: section }
  scope :by_cuisine, -> (cuisine) { where cuisine: cuisine }
  scope :price_sort, -> (opition) { order(price: opition) }
  scope :name_sort, -> (opition) { order(name: opition) }
  scope :views_count_sort, -> (opition) { order(views_count: opition) }
  scope :search_name, -> (search) { where('name LIKE ?', "%#{search}%") }
  def increase_views_count
    self.views_count += 1
    self.save
  end

  def average_rating
    (ratings.blank? || ratings.first.id.nil?) ? 0 : ratings.average(:score).round(2)
  end
end
