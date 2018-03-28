# Create blog posts
10.times do |i|
  Blog.create! title: "Blog post #{i}",
               body:  <<~HERE
  Lorem ipsum dolor sit amet, consectetur adipisicing elit.
  Porro, minima. Quae at nostrum vel itaque odio accusantium possimus,
  architecto ipsa esse quibusdam eius!
  Quia quos modi ratione necessitatibus cupiditate, aspernatur.
HERE
end

# Create skills
5.times do |i|
  Skill.create! title: "Skill #{i}",
                percent_utilized: 20
end

# Create portfolios
9.times do |i|
  Portfolio.create! title: "Portfolio #{i}",
                    subtitle: "My portfolio",
                    main_image: "https://via.placeholder.com/600x400",
                    thumb_image: "https://via.placeholder.com/300x200",
                    body: <<~HERE
  Lorem ipsum dolor sit amet, consectetur adipisicing elit.
  Sequi repellendus incidunt labore, est aspernatur, debitis necessitatibus.
  Officiis, inventore.
HERE
end
