class Order < ApplicationRecord
  belongs_to :user
  belongs_to :delivery_option
  has_one :payment
  has_many :order_items
  has_many :cookies, through: :order_items
  
  accepts_nested_attributes_for :payment
end
