class CreditCard < ApplicationRecord
  belongs_to :user, optional: true
  has_many :orders

  validates :number, :name_on_card, :month_year, :cvv, :presence => true

end
