# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(name: 'Jhon', photo: 'photo_url', bio: 'I am a developer', posts_counter: 2)
User.create(name: 'Bella', photo: 'photo_url', bio: 'I am a teacher', posts_counter: 0)
User.create(name: 'Kim', photo: 'photo_url', bio: 'I am a nurse', posts_counter: 1)
User.create(name: 'Mohamed', photo: 'photo_url', bio: 'I am a technician', posts_counter: 4)

Post.create(title: 'Post of Jhon', text: 'this is a post by jhon', comments_counter: 1, likes_counter: 1, user_id:1)
Post.create(title: 'Post of Bella', text: 'this is a post by Bella', comments_counter: 7, likes_counter: 5, user_id:2)
Post.create(title: 'Post of Kim', text: 'this is a post by Kim', comments_counter: 2, likes_counter: 7, user_id:3)
Post.create(title: 'Post of Mohamed', text: 'this is a post by Mohamed', comments_counter: 0, likes_counter: 9, user_id:4)

Comment.create(user_id:1, post_id:1, text:'wow xD')
Comment.create(user_id:2, post_id:1, text:'wow xD')
Comment.create(user_id:3, post_id:1, text:'wow xD')
Comment.create(user_id:1, post_id:2, text:'wow xD')
Comment.create(user_id:2, post_id:2, text:'wow xD')
Comment.create(user_id:3, post_id:3, text:'wow xD')
Comment.create(user_id:1, post_id:4, text:'wow xD')
Comment.create(user_id:3, post_id:4, text:'wow xD')
Comment.create(user_id:4, post_id:4, text:'wow xD')