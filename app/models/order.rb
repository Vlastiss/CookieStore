class Order < ApplicationRecord
  belongs_to :user
  belongs_to :delivery_option
  belongs_to :payment, optional: true
  has_many :order_items
  has_many :cookies, through: :order_items
  has_one :payment
end
