class Cookie < ApplicationRecord
  has_many :box_cookies, dependent: :destroy
  has_many :order_items, through: :box_cookies
  has_many :orders, through: :order_items
end
