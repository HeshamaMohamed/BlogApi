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

post1 = Post.create!(title: 'Tech Post', body: 'This is a tech post test', user: user1, tags: [tag1])
post2 = Post.create!(title: 'Eco Post', body: 'This is an economics post test', user: user1, tags: [tag1, tag2])
post3 = Post.create!(title: 'Fun Post', body: 'This is a political post test', user: user2, tags: [tag1, tag2, tag3])

comment1_post1 = Comment.create!(body: 'This is comment 1 on post 1', user: user1, post: post1)

comment1_post2 = Comment.create!(body: 'This is comment 1 on post 2', user: user1, post: post2)
comment2_post2 = Comment.create!(body: 'This is comment 2 on post 2', user: user2, post: post2)

comment1_post3 = Comment.create!(body: 'This is comment 1 on post 3', user: user1, post: post3)
comment2_post3 = Comment.create!(body: 'This is comment 2 on post 3', user: user2, post: post3)
comment3_post3 = Comment.create!(body: 'This is comment 3 on post 3', user: user3, post: post3)
