# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# demo user

test = User.create({fname: "test", lname: "test", email: "test@test.com", password: "test", image_url: "https://www.dwolla.com/avatars/" ,})

answer_card_test = AnswerCard.create({user_id: 1, test: "test answer", question_card_id: 1})

question_card_test = QuestionCard.create({user_id: 1, text: "test question", url: "sharelink"})
