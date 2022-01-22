# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(name: 'Jhon', photo: 'photo_url', bio: 'I am a developer', posts_counter: 0)
User.create(name: 'Bella', photo: 'photo_url', bio: 'I am a teacher', posts_counter: 0)
User.create(name: 'Kim', photo: 'photo_url', bio: 'I am a nurse', posts_counter: 0)
User.create(name: 'Mohamed', photo: 'photo_url', bio: 'I am a technician', posts_counter: 0)
