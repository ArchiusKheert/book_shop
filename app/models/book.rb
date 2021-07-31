class Book < ApplicationRecord
  has_many :authorships
  has_many :authors, through: :authorships
  belongs_to :category
  has_many :reviews
  validates :title, :price, presence: true
  validates :title, uniqueness: true

  paginates_per 15

  scope :by_category, -> (category_id) {where category_id: category_id}
end
