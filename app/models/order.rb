class Order < ApplicationRecord
  belongs_to :user
  belongs_to :delivery_option
  belongs_to :payment
end
