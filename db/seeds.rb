# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.new(email: "1user1@example.com",  password: "password123", password_confirmation: "password123").save(:validate => false)
User.new(email: "2user2@example.com",  password: "password123", password_confirmation: "password123").save(:validate => false)
User.new(email: "3user3@example.com",  password: "password123", password_confirmation: "password123").save(:validate => false)
User.new(email: "4user4@example.com",  password: "password123", password_confirmation: "password123").save(:validate => false)
User.new(email: "5user5@example.com",  password: "password123", password_confirmation: "password123").save(:validate => false)
User.new(email: "6user6@example.com",  password: "password123", password_confirmation: "password123").save(:validate => false)
User.new(email: "7user7@example.com",  password: "password123", password_confirmation: "password123").save(:validate => false)