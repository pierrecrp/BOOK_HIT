# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Cleaning database..."
Offer.destroy_all
User.destroy_all

puts "Creating users..."

attributes = [
  { email: "fake@gmail.com", password: "vnoened" },
  
]

user = User.create!(email: "example@gmail.com", password: "zcjben")


puts "Creating offers..."
attributes = [
  { title: "Botanical Butcher", description: "Uses only organic, plant-based poisons. Eco-friendly elimination!", speciality: "poison", price: "1500" },
  { title: "Mother Nature’s Mistake", description: "Arranges for unfortunate 'natural' disasters like falling trees or rockslides.", speciality: "environmental", price: "2599" }
 
]
attributes.each do |attribute|
  offer = Offer.new(attribute)
  offer.user = user
  puts "Created #{offer.title}"
end
puts "Finished!"
