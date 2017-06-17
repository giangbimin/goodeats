class Food < ApplicationRecord
  validates :name, :description, :image_url, :price, :section, :cuisine, :views_count, presence: true
  validates :price, numericality: true

  scope :price_sort, -> (opition) { order(price: opition) }
  scope :name_sort, -> (opition) { order(name: opition) }
  scope :views_count_sort, -> (opition) { order(views_count: opition) }
  scope :by_section, -> (section) { where section: section }
  scope :by_cuisine, -> (cuisine) { where cuisine: cuisine }
end
