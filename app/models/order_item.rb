class OrderItem < ApplicationRecord
  belongs_to :order
  has_many :box_cookies, dependent: :destroy
  has_many :cookies, through: :box_cookies
  
  accepts_nested_attributes_for :box_cookies, allow_destroy: true
  
  # Box configurations with capacity and pricing
  BOXES = {
    'small' => { capacity: 6, price: 20.00 },
    'medium' => { capacity: 12, price: 35.00 },
    'large' => { capacity: 24, price: 60.00 }
  }.freeze
  
  validates :box_size, presence: true, inclusion: { in: BOXES.keys }
  validates :box_price, presence: true, numericality: { greater_than: 0 }
  # Temporarily disable this validation to debug the association issue
  # validate :correct_number_of_cookies
  
  # Calculate the total number of cookies in this box
  def total_cookies
    box_cookies.sum(:quantity)
  end
  
  # Get the capacity for this box size
  def capacity
    BOXES[box_size][:capacity] if box_size.present?
  end
  
  private
  
  def correct_number_of_cookies
    return unless box_size.present?
    
    expected_capacity = BOXES[box_size][:capacity]
    
    # Calculate actual count from both persisted and new records
    actual_count = 0
    
    # Count from persisted box_cookies
    actual_count += box_cookies.sum(:quantity)
    
    # Count from box_cookies_attributes (new records being created)
    if box_cookies_attributes.present?
      box_cookies_attributes.each do |key, attributes|
        next if attributes['_destroy'] == '1' || attributes['_destroy'] == true
        quantity = attributes['quantity'].to_i
        actual_count += quantity if quantity > 0
      end
    end
    
    if actual_count != expected_capacity
      errors.add(:base, "Box must contain exactly #{expected_capacity} cookies (currently has #{actual_count})")
    end
  end
end
