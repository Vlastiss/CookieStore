class Order < ApplicationRecord
  belongs_to :user
  belongs_to :delivery_option
  has_one :payment
  has_many :order_items
end
