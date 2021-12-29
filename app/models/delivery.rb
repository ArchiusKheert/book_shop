class Delivery < ApplicationRecord
  has_many :orders
  validates :name, :price, :time, presence: true

  validates :name, uniqueness: true
  validates :name, length: { maximum: 50}
  validates :price, numericality: true
end
