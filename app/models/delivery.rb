class Delivery < ApplicationRecord
  has_many :orders
  validates :name, :price, :time, presence: true
end
