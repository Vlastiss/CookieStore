class BoxCookie < ApplicationRecord
  belongs_to :order_item
  belongs_to :cookie
  
  validates :quantity, presence: true, numericality: { greater_than: 0, only_integer: true }
end
