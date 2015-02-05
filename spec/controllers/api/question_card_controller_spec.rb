describe "Question Card API" do

  describe "GET /api/question_cards" do
    it "returns all the question cards" do
      user = User.create({fname:"bob", lname:"smith", password:"123"})
      qcard1 = QuestionCard.create({text:"this is a test", url:"www.google.com", })

    end
  end
  
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

