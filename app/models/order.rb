class Order < ApplicationRecord
  belongs_to :user
  belongs_to :delivery_option
  has_one :payment
  has_many :order_items, dependent: :destroy
  has_many :box_cookies, through: :order_items
  has_many :cookies, through: :box_cookies
  
  accepts_nested_attributes_for :payment
  accepts_nested_attributes_for :order_items, allow_destroy: true
  
  validates :order_items, presence: { message: "must have at least one box" }
  
  # Calculate total price before saving
  before_save :calculate_total_price
  
  private
  
  def calculate_total_price
    boxes_total = order_items.sum(:box_price)
    delivery_cost = delivery_option&.price || 0
    self.total_price = boxes_total + delivery_cost
  end
end
