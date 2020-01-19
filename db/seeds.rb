# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
    email: "admin@admin.com",
    password: "123456",
    password_confirmation: "123456",
    name: "Admin User",
    roles: "site_admin"
)
3.times do |topic|
    Topic.create!(
        title: Faker::Movie.quote
    )
end

puts "3 topic created!"

10.times do
    Blog.create([{
        title: Faker::Name.name, 
        body: Faker::Lorem.sentence,
        topic: Topic.first
    }])
end

puts "10 blog posts created!"

10.times do
    Skill.create([{
        title: Faker::Name.name, 
        percente_utilized: Faker::Number.between(from: 1, to: 100)
    }])
end

puts "10 skills created!"
count = 1
9.times do
    Portfolio.create([{
        title: Faker::Name.name, 
        subtitle: Faker::Name.name,
        body: Faker::Lorem.sentence,
        position: count,
        main_image: "https://via.placeholder.com/600x400",
        thumb_image: "https://via.placeholder.com/350x200"
    }])
    count += 1
end

puts "9 portfolio created!"

3.times do
    Portfolio.last.technologies.create([{
        name: Faker::Name.name, 
        portfolio_id: Portfolio.last
    }])
end

puts "3 technologies created!"