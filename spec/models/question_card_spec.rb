require 'rails_helper'

describe QuestionCard do

  describe "when many answer cards are created that reference it" do
    it "will have many answer cards" do
      user = User.create(fname:"Bob", lname:"Smith", email:"bob@bob.com", password:"123")
      q_card = QuestionCard.new()

    end
  end

end


  # create_table "answer_cards", force: :cascade do |t|
  #   t.string   "user_id"
  #   t.string   "text"
  #   t.string   "question_card_id"
  #   t.datetime "created_at",       null: false
  #   t.datetime "updated_at",       null: false
  # end

  # create_table "question_cards", force: :cascade do |t|
  #   t.string   "user_id"
  #   t.string   "text"
  #   t.string   "url"
  #   t.string   "expiration_date"
  #   t.string   "datetime"
  #   t.datetime "created_at",      null: false
  #   t.datetime "updated_at",      null: false
  # end

  # create_table "users", force: :cascade do |t|
  #   t.string   "fname"
  #   t.string   "lname"
  #   t.string   "email"
  #   t.string   "password_digest"
  #   t.string   "image_url"
  #   t.datetime "created_at",      null: false
  #   t.datetime "updated_at",      null: false
  # end


