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

user = User.create!(user_name: "bellobito", email: "example@gmail.com", password: "zcjben")


puts "Creating offers..."
attributes = [
  { title: "Botanical Butcher", description: "Uses only organic, plant-based poisons. Eco-friendly elimination!", speciality: "poison", price: "1500" },
  { title: "Mother Nature’s Mistake", description: "Arranges for unfortunate 'natural' disasters like falling trees or rockslides.", speciality: "environmental", price: "2500" },
  { title: "Clumsy Constructor", description: "Makes sure something heavy accidentally falls from a construction site. Hard hat recommended—but won’t help..", speciality: "accident", price: "750" },
  { title: "Digital Doom", description: "Hacks into systems to cause fatal malfunctions, like self-driving cars gone rogue or smart homes turned deadly.", speciality: "technological", price: "2000" },
  { title: "Weather Wrecker", description: "Manipulates the environment to cause freak accidents—like lightning strikes or sudden floods.", speciality: "environmental", price: "1000" },
  { title: "Bird of Prey Punisher", description: "Uses trained birds of prey to make the target disappear without a trace—literally flown away.", speciality: "animal", price: "7500" },
  { title: "Costume Carnage", description: "Wears absurd outfits—like a clown or a delivery person—adding a layer of dark humor to the act.", speciality: "creative", price: "4000" },
  { title: "Fireworks Finale", description: "Specializes in turning everyday objects into unexpected pyrotechnic displays. A bang that no one will forget.", speciality: "explosives", price: "6500" },
  { title: "Doctor of Doom", description: "Fakes medical credentials to gain access to the target and administers a lethal treatment.", speciality: "creative", price: "550" },
  { title: "Sniper Supreme", description: "A long-distance expert who can take out targets from a mile away with precision. You won’t even hear it coming.", speciality: "gun fire", price: "3000" },
  { title: "Gourmet Gone Wrong", description: "A culinary expert who specializes in spicing up meals with deadly ingredients. Perfect for those who enjoy a fine last supper.", speciality: "poison", price: "1500" },
]
attributes.each do |attribute|
  offer = Offer.new(attribute)
  offer.user = user
  offer.save!
  puts "Created #{offer.title}"
end
puts "Finished!"
