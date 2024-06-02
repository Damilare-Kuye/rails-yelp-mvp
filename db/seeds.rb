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

puts "Cleaning database..."
Review.destroy_all
Restaurant.destroy_all

puts "Creating restaurants..."
dishoom = { name: "Dishoom", address: "7 Boundary St, London E2 7JE", category: "chinese" }
pizza_east = { name: "Pizza East", address: "56A Shoreditch High St, London E1 6PQ", category: "belgian"}

restaurants = [dishoom, pizza_east].map do |attributes|
  restaurant = Restaurant.create!(attributes)
  puts "Created #{restaurant.name}"
  restaurant
end

puts "Creating reviews..."
reviews = [
  { rating: 5, content: "Very nice place",restaurant: restaurants[0] },
  { rating: 4, content: "The food is amazing",restaurant: restaurants[1] }
]

reviews.each do |review_attributes|
  review = Review.create!(review_attributes)
  puts "Created review with rating #{review.rating} for #{review.restaurant.name}"
end

puts "Finished!"
