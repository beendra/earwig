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
  {username: "Wanda Maximoff", password: "mno345",email: "Wanda@yahoo.com"}
]

users.each { |user| User.create(user) }



podcasts = [
    {title: "Joe Budden Podcast", description: "Hip-hop/Comedy", length: "Long", mood_id: 1},
    {title: "Joe Rogan", description: "Comedy/Conspiracy", length: "Long", mood_id: 4 },
    {title: "Science Time", description: "Sci-Fi/Short stories", length: "Short", mood_id:4},
    {title: " Plants with bob ", description: "Nature/Outdoor topics ", length: "Average", mood_id:2}
  ]
  
  podcasts.each {|podcast| Podcast.create(podcast)}
  
  reviews = [ "I really loved this episode, keep it up !! ", "This Sh*t was trash !!! ", "Cant wait for next Week !! ", "Unsubscribed this was very offensive !!!", "I really loved this episode, keep it up !! "
  ]


5.times do 
Review.create(content: reviews.to_a.sample, user: User.all.to_a.sample, podcast: Podcast.all.to_a.sample)
end

5.times do 
    Favorite.create(user: User.all.to_a.sample, podcast: Podcast.all.to_a.sample)
end

puts "SEEDED 🌿"