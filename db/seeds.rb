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

question_card1 = QuestionCard.create({user_id:user1.id, question_text: "test question", url: "www.google.com"})
question_card2 = QuestionCard.create({user_id:user1.id, question_text: "another question", url: "www.yahoo.com"})
question_card3 = QuestionCard.create({user_id:user1.id, question_text: "yet another question ", url: "www.cheezburger.com"})

AnswerCard.create({user_id: user1.id, answer_text: "test answer", question_card_id: question_card1})
AnswerCard.create({user_id: user1.id, answer_text: "test answer", question_card_id: question_card1})
AnswerCard.create({user_id: user1.id, answer_text: "test answer", question_card_id: question_card1})
