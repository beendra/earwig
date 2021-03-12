Review.destroy_all
Like.destroy_all
Favorite.destroy_all
User.destroy_all
Podcast.destroy_all
Mood.destroy_all
Review.reset_pk_sequence
Like.reset_pk_sequence
Favorite.reset_pk_sequence
User.reset_pk_sequence
Podcast.reset_pk_sequence
Mood.reset_pk_sequence

moods = [
  {feeling: "Happy"},
  {feeling: "Sad"},
  {feeling: "Anxious"},
  {feeling: "Mysterious" }
]

moods.each {|mood| Mood.create(mood)}

users = [
  {username: "Kamala Khan", password: "abc123",email: "Kamala@yahoo.com"},
  {username: "Doreen Green", password: "def456", email: "Doreen@yahoo.com"},
  {username: "Gwen Stacy", password: "ghi789",email: "Gwen@yahoo.com" },
  {username: "Janet Van Dyne", password: "jkl012",email: "Janet@yahoo.com"},
  {username: "Wanda Maximoff", password: "mno345",email: "Wanda@yahoo.com"},
  {username: "Bruce Banner", password: "abc123",email: "Bruce@yahoo.com"},
  {username: "Thor", password: "abc123",email: "Kamala@yahoo.com"},
  {username: "Miles Morales", password: "abc123",email: "Miles@yahoo.com"},
  {username: "Stephen Strange", password: "abc123",email: "Strange@yahoo.com"},
  {username: "Tony Starks", password: "abc123",email: "Tony@yahoo.com"},
  {username: "T'Challa", password: "abc123",email: "Challa@yahoo.com"},
  {username: "Clint Barton", password: "abc123",email: "Clint@yahoo.com"},
  {username: "Steven Rogers", password: "abc123",email: "Steve@yahoo.com"},
  {username: "Wade Wilson", password: "abc123",email: "Wade@yahoo.com"},
  {username: "Matt Murdock", password: "abc123",email: "Matt@yahoo.com"}

]

users.each { |user| User.create(user) }



podcasts = [
    {title: "Joe Budden Podcast", description: "Hip-hop/Comedy", length: "Long", mood_id: 1},
    {title: "Joe Rogan", description: "Comedy/Conspiracy", length: "Long", mood_id: 4 },
    {title: "Science Time", description: "Sci-Fi/Short stories", length: "Short", mood_id:4},
    {title: " Plants with bob", description: "Nature/Outdoor topics ", length: "Average", mood_id:2},
    {title: "Bully and The Beast", description: "Romance/Comedy", length: "Average", mood_id: 1},
    {title: "The Brilliant Idiots", description: "Pop-Culture/Comedy", length: "Long", mood_id: 1},
    {title: "Home Cooking", description: "Cooking", length: "Short", mood_id: 2},
    {title: "Dead Eyes", description: "Murder-Mystery", length: "Short", mood_id: 3},
    {title: "The Daily", description: "News", length: "Long", mood_id: 2},
    {title: "Outsiders", description: "Murder-Mystery", length: "Short", mood_id: 4},
    {title: "Staying In With Emily and Kumail", description: "Pop-culture", length: "Average", mood_id: 2},
    {title: "Pardon My Take", description: "Sports", length: "Average", mood_id: 2},
    {title: "All the Smoke", description: "Sports", length: "Long", mood_id: 1},
    {title: "The Bill Simmons Podcast", description: "Sports", length: "Long", mood_id: 3},
    {title: "The Lowe Post", description: "Sports", length: "Average", mood_id: 4},

  ]
  
  podcasts.each {|podcast| Podcast.create(podcast)}
  
  reviews = [ "I really loved this episode, keep it up !! ", "This Sh*t was trash !!! ", "Cant wait for next Week !! ", "Unsubscribed this was very offensive !!!", "I really loved this episode, keep it up !! ",
  "Great Show Guys","Hated it","turned it off","Cant wait for tomorrow","I Love to listen while i code","I almost got fired for listening at work lol"]


40.times do 
Review.create(content: reviews.to_a.sample, user: User.all.to_a.sample, podcast: Podcast.all.to_a.sample)
end

40.times do 
    Favorite.create(user: User.all.to_a.sample, podcast: Podcast.all.to_a.sample)
end

puts "SEEDED 🌿"