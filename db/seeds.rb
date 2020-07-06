# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.new(email: "user1@example.com",  password: "password123", password_confirmation: "password123").save(:validate => false)
User.new(email: "user2@example.com",  password: "password123", password_confirmation: "password123").save(:validate => false)
User.new(email: "user3@example.com",  password: "password123", password_confirmation: "password123").save(:validate => false)
User.new(email: "user4@example.com",  password: "password123", password_confirmation: "password123").save(:validate => false)
User.new(email: "user5@example.com",  password: "password123", password_confirmation: "password123").save(:validate => false)
User.new(email: "user6@example.com",  password: "password123", password_confirmation: "password123").save(:validate => false)
User.new(email: "user7@example.com",  password: "password123", password_confirmation: "password123").save(:validate => false)