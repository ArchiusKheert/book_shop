class Book < ApplicationRecord
  has_many :authorships
  has_many :authors, through: :authorships
  belongs_to :category
  has_many :order_items
  has_many :orders, through: :order_items
  has_many :reviews


  validates :title, presence: true, uniqueness: true
  validates :price, presence: true, numericality: true
  validates :height, :width, :depth, numericality: true

  paginates_per 15

  scope :by_category, -> (category_id) {where category_id: category_id}

  def sales
    orders.payed.map { |order| order.order_items.sum(:quantity)}.sum
  end

  def self.bestsellers(category_id = nil)
    return Book.all.sort_by(&:sales).reverse unless category_id
    Book.by_category(category_id).sort_by(&:sales).reverse
  end
end
