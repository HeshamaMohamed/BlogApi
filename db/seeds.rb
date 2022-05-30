# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create!(email: 'email1@test.com', password: 'password1', name: 'first name test')
user2 = User.create!(email: 'email2@test.com', password: 'password2', name: 'second name test')
user3 = User.create!(email: 'email3@test.com', password: 'password3', name: 'third name test')

tag1 = Tag.create!(name: 'Tech')
tag2 = Tag.create!(name: 'Economics')
tag3 = Tag.create!(name: 'Politics')

Post.create!(title: 'Tech Post', body: 'This is a tech post test', user: user1, tags: [tag1])
Post.create!(title: 'Economics', body: 'This is an economics post test', user: user1, tags: [tag2])
Post.create!(title: 'Political Post', body: 'This is a political post test', user: user2, tags: [tag3])
