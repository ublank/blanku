# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# demo user
User.destroy_all
AnswerCard.destroy_all
QuestionCard.destroy_all

user1 = User.create({fname: "test", lname: "test", email: "test@test.com", password: "test", image_url: "https://www.dwolla.com/avatars/" ,})

question_card1 = QuestionCard.create({user_id:user1.id, text: "test question", url: "www.google.com"})
question_card2 = QuestionCard.create({user_id:user1.id, text: "another question", url: "www.yahoo.com"})
question_card3 = QuestionCard.create({user_id:user1.id, text: "yet another question ", url: "www.cheezburger.com"})

AnswerCard.create({user_id: user1.id, text: "test answer", question_card_id: question_card1})
AnswerCard.create({user_id: user1.id, text: "test answer", question_card_id: question_card1})
AnswerCard.create({user_id: user1.id, text: "test answer", question_card_id: question_card1})



<<<<<<< HEAD
# test = User.create({fname: "test", lname: "test", email: "test@test.com", password: "test", image_url: "https://www.dwolla.com/avatars/" ,})

answer_card_test = AnswerCard.create({user_id: 1, text: "test answer", question_card_id: 1})
=======

>>>>>>> 4459926662fd70e98c42e3d79572cd1af0495e6c

User.create({fname: "Peter", lname: "Hahn", email: "peter.hahn@live.com", password: "test", image_url: "https://media.licdn.com/media/p/4/005/09f/0bc/3284857.jpg"})
User.create({fname: "Tova", lname: "Moskowitz", email: "tovamosk@gmail.com", password: "test", image_url: "https://media.licdn.com/media/p/6/005/097/2f6/123d831.jpg"})
User.create({fname: "Lily", lname: "Mathias", email: "lily@lily.com", password: "test", image_url: "https://media.licdn.com/mpr/mpr/shrink_200_200/p/8/005/08a/249/10567ee.jpg"})
User.create({fname: "Joel", lname: "Belgrove", email: "jaymars1001@gmail.com", password: "test", image_url: "https://media.licdn.com/mpr/mpr/shrink_200_200/p/4/005/08b/3a3/3df6672.jpg" ,})
User.create({fname: "Gretchen", lname: "Ziegler", email: "gretchenziegler@gmail.com", password: "test", image_url: "https://media.licdn.com/mpr/mpr/shrink_200_200/p/2/005/070/32d/2abc6e7.jpg
"})
User.create({fname: "Angelo", lname: "Galasso", email: "alasso.angelo1@gmail.com", password: "test", image_url: "https://media.licdn.com/mpr/mpr/shrink_200_200/p/3/005/093/2dd/3528d2b.jpg"})
User.create({fname: "Zac", lname: "Messinger", email: "zac.messinger@gmail.com", password: "test", image_url: "https://media.licdn.com/mpr/mpr/shrink_200_200/p/4/005/086/016/3cef8a0.jpg"})
User.create({fname: "Sol", lname: "Cameron", email: "scameron110@gmail.com", password: "test", image_url: "https://media.licdn.com/media/p/7/005/087/076/1204a77.jpg"})
User.create({fname: "John", lname: "Bell", email: "johnrbell@gmail.com", password: "test", image_url: "https://media.licdn.com/mpr/mpr/shrink_200_200/p/7/005/0ae/12b/2b0eb07.jpg"})
User.create({fname: "Umer", lname: "Dar", email: "umerbashirdar@gmail.com", password: "test", image_url: "https://media.licdn.com/media/p/5/005/0b0/373/2ff643a.jpg" ,})
User.create({fname: "Sean", lname: "Jackson", email: "sjackson44@gmail.com", password: "test", image_url: "https://media.licdn.com/mpr/mpr/shrink_200_200/p/3/000/297/2aa/0477a02.jpg"})
User.create({fname: "Ray", lname: "Chiu", email: "ray.ch@live.com", password: "test", image_url: "https://media.licdn.com/mpr/mpr/shrink_200_200/p/2/005/088/03d/2633a21.jpg
"})
User.create({fname: "Logan", lname: "Smith", email: "logan29smith@gmail.com", password: "test", image_url: "https://media.licdn.com/mpr/mpr/shrink_200_200/p/8/000/1b9/331/0aea1fd.jpg"})
User.create({fname: "Amy", lname: "Li", email: "li.amyyi@gmail.com", password: "test", image_url: "https://media.licdn.com/mpr/mpr/shrink_400_400/p/6/005/046/345/0445d6b.jpg
"})
User.create({fname: "Gael", lname: "Blanchemain", email: "gael@gael.com", password: "test", image_url: "https://media.licdn.com/mpr/mpr/shrink_200_200/p/8/005/044/063/08d2306.jpg"})
User.create({fname: "David", lname: "Berg", email: "davidcarlsonberg@gmail.com", password: "test", image_url: "https://media.licdn.com/mpr/mpr/shrink_200_200/p/4/005/03e/02b/3616cdd.jpg" ,})
User.create({fname: "Niels", lname: "Sorensen", email: "niels.ws@gmail.com", password: "test", image_url: "https://media.licdn.com/mpr/mpr/shrink_400_400/p/6/005/022/2f9/301bc7d.jpg"})
User.create({fname: "Mina", lname: "Talai", email: "mina.talai@gmail.com", password: "test", image_url: "https://media.licdn.com/mpr/mpr/shrink_200_200/p/4/005/09e/34d/0f5632d.jpg"})
User.create({fname: "Jarett", lname: "Sims", email: "jarett.sims@gmail.com", password: "test", image_url: "https://media.licdn.com/mpr/mpr/shrink_200_200/p/2/005/06b/089/03504c9.jpg
"})
User.create({fname: "Ivette", lname: "Addington", email: "ivettewaddington@gmail.com", password: "test", image_url: "https://media.licdn.com/mpr/mpr/shrink_200_200/p/7/000/21f/29d/1dbcde1.jpg"})
User.create({fname: "Alex", lname: "Wang", email: "alexwang949@gmail.com", password: "test", image_url: ""})
User.create({fname: "GiSung", lname: "Park", email: "saturns2k@msn.com", password: "test", image_url: ""})
User.create({fname: "Collin", lname: "Meyers", email: "cfmeyers@gmail.com", password: "test", image_url: ""})
User.create({fname: "Ed", lname: "Brooks", email: "edbrooks214@gmail.com", password: "test", image_url: ""})
User.create({fname: "Tania", lname: "Turzer", email: "t.turzer@yahoo.com", password: "test", image_url: ""})
