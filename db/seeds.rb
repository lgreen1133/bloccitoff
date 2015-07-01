require 'faker'

# Create Users
5.times do 
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end
users = User.all 

# Create Items
10.times do 
  Item.create!(
    name: Faker::Lorem.word
    )
end
items = Item.all

puts "Seed finished"
puts "#{Item.count} items created"