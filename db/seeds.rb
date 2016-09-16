# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: 'NoName',password: Digest::MD5.hexdigest('123'),bio:'O futuro passa primeiro aqui.',email:'a@a.com',image:'https://pbs.twimg.com/profile_images/2249475191/Avatar_-_Redes_Sociais_bigger.png')
User.create(username: 'PC_fake',password: Digest::MD5.hexdigest('123'),bio:'Youtuber desde antes de existir youtuber. CONTATO: pcsiqueiracontato@gmail.com',email:'b@b.com',image:'https://pbs.twimg.com/profile_images/767573547766120448/R-ApcliH_bigger.jpg')
User.create(username: 'programadorFAKE',password: Digest::MD5.hexdigest('123'),bio:'Programador, Professor, Palestrante, Autor, Webcartunista, Humorista e Sex Symbol.',email:'c@c.com',image:'https://pbs.twimg.com/profile_images/759105266558373889/-jyAVXge_bigger.jpg')

Post.create(content: 'E-book: Um guia para REST e criação de APIs: http://cainc.to/FOmzM2 ', datetime: Time.now, location: 'São Paulo', id_user: 1)
Post.create(content: 'Nem todo mundo sabe mas nadar em rio é mais difícil que no mar. Água do mar é mais densa.', datetime: Time.now, location: 'Recife', id_user: 2)
Post.create(content: 'depois dessa noite péssima vou até dormir mesmo', datetime: Time.now, location: 'São Paulo', id_user: 1)
Post.create(content: 'A internet é impressionante. Não importa o quão obvia seja uma brincadeira alguém vai sempre levar a serio.', datetime: Time.now, location: 'Recife', id_user: 3)
Post.create(content: 'Não acompanho novelas, mas o Domingos Montagner era um cara tão simpático e tão bom ator que não dá pra não ficar triste', datetime: Time.now, location: 'São Paulo', id_user: 1)
Post.create(content: 'Macbook Pro também deve perder entrada para fones de ouvido: http://bit.ly/2cITgVJ ', datetime: Time.now, location: 'Recife', id_user: 2)
Post.create(content: 'Sony quer levar filmes e programas de TV para o PlayStation VR: http://bit.ly/2crz10s', datetime: Time.now, location: 'São Paulo', id_user: 1)

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