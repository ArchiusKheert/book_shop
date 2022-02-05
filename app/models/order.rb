class Order < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :delivery, optional: true
  belongs_to :credit_card, optional: true

  has_many :order_items, dependent: :destroy
  has_many :books, through: :order_items
  has_many :addresses, dependent: :destroy
  has_one :billing
  has_one :shipping
  has_one :credit_card


  #accepts_nested_attributes_for :billing_address
  #accepts_nested_attributes_for :shipping_address


  after_create :set_number, :set_status

  enum status: %i[in_progress in_queue in_delivery delivered canceled]

  #scope :in_progress, -> { where status: 'in_progress'}
  scope :in_queue, -> { where status: 'in_queue'}
  scope :in_delivery, -> {where status: 'in_delivery'}
  scope :delivered, -> { where status: 'delivered'}
  scope :canceled, -> { where status: 'canceled'}
  scope :in_progress, -> { where status: %w[in_queue in_delivery]}

  scope :payed, -> {where.not status: %w[in_progress canceled]}

  def place_in_queue
    update(status: 1, completed_at: Time.current)
  end

  def sub_total
    order_items.to_a.sum(&:total)
  end

  private

  def set_number
    update(number: "R#{id.to_s.rjust(8, '0')}")
  end

  def set_status
    update(status: 0)
  end

end
