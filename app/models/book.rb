class Book < ApplicationRecord
  has_many :reviews
  has_and_belongs_to_many :authors
  has_and_belongs_to_many :category

  validates :title, uniqueness: true

  paginates_per 15
end
