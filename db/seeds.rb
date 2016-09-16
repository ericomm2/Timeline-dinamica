# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Post.create(content: 'testando os posts', datetime: Time.now, location: 'Recife', id_user: 1)
Post.create(content: 'testando os posts', datetime: Time.now, location: 'Recife', id_user: 1)
Post.create(content: 'testando os posts', datetime: Time.now, location: 'Recife', id_user: 1)
Post.create(content: 'testando os posts', datetime: Time.now, location: 'Recife', id_user: 1)
Post.create(content: 'testando os posts', datetime: Time.now, location: 'Recife', id_user: 1)
Post.create(content: 'testando os posts', datetime: Time.now, location: 'Recife', id_user: 1)
Post.create(content: 'testando os posts', datetime: Time.now, location: 'Recife', id_user: 1)

Like.create(user_id:1,post_id:1)
Like.create(user_id:1,post_id:2)
Like.create(user_id:1,post_id:3)
Like.create(user_id:1,post_id:4)
Like.create(user_id:1,post_id:7)
Like.create(user_id:2,post_id:1)
Like.create(user_id:3,post_id:1)
Like.create(user_id:2,post_id:2)
Like.create(user_id:2,post_id:2)
Like.create(user_id:3,post_id:3)