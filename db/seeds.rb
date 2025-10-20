# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

# Clear existing data
puts "Clearing existing data..."
BoxCookie.destroy_all
OrderItem.destroy_all
Payment.destroy_all
Order.destroy_all
Cookie.destroy_all
DeliveryOption.destroy_all
User.destroy_all

# Create Users
puts "Creating users..."
User.create!(name: "Alex Johnson", email: "alex@example.com", address: "123 Cookie Lane, Sweet City, SC 12345")
User.create!(name: "Sarah Smith", email: "sarah@example.com", address: "456 Bakery Street, Treat Town, TT 67890")

# Create Delivery Options
puts "Creating delivery options..."
DeliveryOption.create!(name: "Standard Delivery (3-5 days)", price: 5.00)
DeliveryOption.create!(name: "Express Delivery (1-2 days)", price: 10.00)
DeliveryOption.create!(name: "Same Day Delivery", price: 15.00)

# Create Cookies
puts "Creating cookies..."
Cookie.create!(name: "Chocolate Chip", description: "Classic cookies with rich chocolate chips", price: 3.00, image_url: "choco.jpg")
Cookie.create!(name: "Oatmeal Raisin", description: "Wholesome oats with sweet raisins", price: 2.75, image_url: "oatmeal.jpg")
Cookie.create!(name: "Peanut Butter", description: "Creamy peanut butter perfection", price: 3.25, image_url: "peanut.jpg")
Cookie.create!(name: "Double Chocolate", description: "For the ultimate chocolate lovers", price: 3.50, image_url: "double_choco.jpg")
Cookie.create!(name: "Sugar Cookie", description: "Sweet and buttery classic", price: 2.50, image_url: "sugar.jpg")
Cookie.create!(name: "Snickerdoodle", description: "Cinnamon sugar delight", price: 2.75, image_url: "snickerdoodle.jpg")

puts "Seed data created successfully!"
puts "Users: #{User.count}"
puts "Cookies: #{Cookie.count}"
puts "Delivery Options: #{DeliveryOption.count}"

