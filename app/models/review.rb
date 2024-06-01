class Review < ApplicationRecord
  belongs_to :restaurant
  validates :rating, numericality: { only_integer: true }
  validates :content, presence: true
  validates :rating, inclusion: { in: 0..5}
end
