# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
    Blog.create([{
        title: Faker::Name.name, 
        body: Faker::Lorem.sentence
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

9.times do
    Portfolio.create([{
        title: Faker::Name.name, 
        subtitle: Faker::Name.name,
        body: Faker::Lorem.sentence,
        main_image: "https://via.placeholder.com/600x400",
        thumb_image: "https://via.placeholder.com/350x200"
    }])
end

puts "10 skills created!"