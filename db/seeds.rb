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

User.create!(name: "Alex", email: "alex@example.com", address: "123 Cookie Lane")

DeliveryOption.create!(name: "Standard", price: 2.50)
DeliveryOption.create!(name: "Express", price: 5.00)

Cookie.create!(name: "Chocolate Chip", description: "Crispy on the outside, chewy inside", price: 3.00, image_url: "choco.jpg")
Cookie.create!(name: "Oatmeal Raisin", description: "Wholesome and sweet", price: 2.75, image_url: "oatmeal.jpg")

