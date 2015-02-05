require 'rails_helper'

describe Api::QuestionCardsController do

  # describe "GET /api/question_cards" do
  #   it "returns all the question cards" do
  #     user = User.create({fname:"bob", lname:"smith", password:"123"})
  #     QuestionCard.create({text:"this is a test", url:"www.google.com", expiration_date:Date.today, user_id:user.id})
  #     QuestionCard.create({text:"some more stuff", url:"www.google.com", expiration_date:Date.today, user_id:user.id})
  #     QuestionCard.create({text:"an even more interesting message", url:"www.google.com", expiration_date:Date.today, user_id:user.id})
  #     QuestionCard.create({text:"bloop", url:"www.google.com", expiration_date:Date.today, user_id:user.id})
  #     get "/api/question_cards", {}, { "Accept" => "application/json" }
  #     # get "/api/question_cards"
# # No route matches {:action=>"/api/question_cards", :controller=>"api/question_cards"}
  #     expect(response.status).to eq 200
  #   end
  # end
  
end

# create_table "question_cards", force: :cascade do |t|
#     t.integer  "user_id"
#     t.string   "text"
#     t.string   "url"
#     t.string   "expiration_date"
#     t.string   "datetime"
#     t.datetime "created_at",      null: false
#     t.datetime "updated_at",      null: false
#   end

#   create_table "users", force: :cascade do |t|
#     t.string   "fname"
#     t.string   "lname"
#     t.string   "email"
#     t.string   "password_digest"
#     t.string   "image_url"
#     t.datetime "created_at",      null: false
#     t.datetime "updated_at",      null: false
#   end

