# Create site admin
User.create! name: "Admin", email: "admin@local.com",
             password: "123", password_confirmation: "123",
             roles: "site_admin"
puts "Site admin created! email: admin@local.com, password: 123"

# Create topics
3.times do
  Topic.create! title: Faker::Lorem.word.capitalize
end
puts "3 topics created"

# Create blog posts
10.times do
  Blog.create! title:    Faker::Lorem.sentence,
               body:     Faker::Lorem.paragraph(10),
               topic_id: Topic.last.id
end
puts "10 blog posts created!"

# Create skills
5.times do
  Skill.create! title:            Faker::Lorem.word.capitalize,
                percent_utilized: 20
end
puts "5 skills created!"

# Create portfolio items
8.times do |i|
  Portfolio.create! title:       Faker::Lorem.word.capitalize,
                    body:        Faker::Lorem.paragraph(4),
                    subtitle:    "Ruby on Rails",
                    position:    i + 1
end

Portfolio.create! title:       Faker::Lorem.word.capitalize,
                  body:        Faker::Lorem.paragraph(4),
                  subtitle:    "Angular",
                  position:    9

puts "9 portfolio items created!"

3.times do
  Portfolio.last.technologies.create! name: Faker::Lorem.word.capitalize
end

puts "3 technologies created for the last portfolio!"
