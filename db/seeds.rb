# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([{ name: "Stan", email: "example@gmail.com", password: "password" },
             { name: "Stan-ji", email: "example@mail.com", password: "password" },
             { name: "facebook", email: "facebook@test.net", password: "password" },
             { name: "Strong Parameter", email: "strong.para@test.com", password: "password" },
             { name: "John Doe", email: "J.D@mail.com", password: "password" }])

Friendship.create([
  { user_id: 1, friend_id: 2 },
  { user_id: 1, friend_id: 3 },
  { user_id: 1, friend_id: 4 },
  { user_id: 1, friend_id: 5 },
  { user_id: 2, friend_id: 3 },
  { user_id: 2, friend_id: 4 }
])

Post.create([
  { title: "Stan's first post", body: "Just checking out the site's functionality.",
    user_id: 1, created_at: 5.hours.ago },
  { title: "Stan-ji's first post", body: "I don't know what to write.",
    user_id: 2, created_at: 10.hours.ago },
  { title: "facebook's first post", body: "Lorem Ipsum, blablabla.",
    user_id: 3, created_at: 2.days.ago },
  { title: "Strong Parameter's first post", body: "Lorem Ipsum, dolor sectum set amet.",
    user_id: 4, created_at: 30.minutes.ago },
  { title: "John Doe's first post", body: "Hey guys! I am an anonymous user person.",
    user_id: 5, created_at: 3.months.ago },
  { title: "Timeline test", body: "I am just putting in an extra post. This is also "+
    "a bit to try out the timeline feature.", user_id: 1, created_at: Time.now }
])

Like.create([
  { user_id: 1, post_id: 1 },
  { user_id: 1, post_id: 2 },
  { user_id: 1, post_id: 3 },
  { user_id: 1, post_id: 4 },
  { user_id: 1, post_id: 5 },
  { user_id: 1, post_id: 6 },
  { user_id: 4, post_id: 3 },
  { user_id: 4, post_id: 4 },
])

Comment.create([
  { user_id: 1, post_id: 2, content: "Wow, wow WOW!!" },
  { user_id: 1, post_id: 3, content: "Hmm, okay, I guess?" },
  { user_id: 1, post_id: 4, content: "I want to have some cudos for my comments." },
  { user_id: 1, post_id: 5, content: "Lorem G-unit!" },
  { user_id: 2, post_id: 3, content: "Same, same, same... It's always the same story." },
  { user_id: 2, post_id: 1, content: "I really learned something today, thanks man!" },
  { user_id: 2, post_id: 4, content: "This is what it's all about." },
])