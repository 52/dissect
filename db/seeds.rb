# Create blog posts
10.times do |i|
  Blog.create! title: Faker::Lorem.sentence,
               body:  Faker::Lorem.paragraph(10)
end
puts "10 blog posts created!"

# Create skills
5.times do |i|
  Skill.create! title:            Faker::Lorem.word,
                percent_utilized: 20
end
puts "5 skills created!"

# Create portfolio items
9.times do |i|
  Portfolio.create! title:       Faker::Lorem.word,
                    body:        Faker::Lorem.paragraph(4),
                    subtitle:    Faker::Lorem.sentence ,
                    main_image:  "https://via.placeholder.com/600x400",
                    thumb_image: "https://via.placeholder.com/300x200"
end
puts "9 portfolio items created!"
