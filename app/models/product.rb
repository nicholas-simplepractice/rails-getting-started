class Product < ApplicationRecord
  # Product model needs to have an explicit one-to-many relation with subscribers
  #   and that when the product record is destroyed, their subscribers should be too
  has_many :subscribers, dependent: :destroy

  has_one_attached :featured_image
  has_rich_text :description

  validates :name, presence: true
  validates :inventory_count, numericality: { greater_than_or_equal_to: 0 }
end
