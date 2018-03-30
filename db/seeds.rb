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
8.times do
  Portfolio.create! title:       Faker::Lorem.word.capitalize,
                    body:        Faker::Lorem.paragraph(4),
                    subtitle:    "Ruby on Rails",
                    main_image:  "https://via.placeholder.com/600x400",
                    thumb_image: "https://via.placeholder.com/300x200"
end

Portfolio.create! title:       Faker::Lorem.word.capitalize,
                  body:        Faker::Lorem.paragraph(4),
                  subtitle:    "Angular",
                  main_image:  "https://via.placeholder.com/600x400",
                  thumb_image: "https://via.placeholder.com/300x200"

puts "9 portfolio items created!"
