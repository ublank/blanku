require 'rails_helper'

describe Api::QuestionCardsController do

  describe "GET /api/question_cards", :type => :request do
    it "returns all the question cards" do
      user = User.create({fname:"bob", lname:"smith", password:"123"})
      QuestionCard.create({text:"this is a test", url:"www.google.com", expiration_date:Date.today, user_id:user.id})
      QuestionCard.create({text:"some more stuff", url:"www.google.com", expiration_date:Date.today, user_id:user.id})
      QuestionCard.create({text:"an even more interesting message", url:"www.google.com", expiration_date:Date.today, user_id:user.id})
      QuestionCard.create({text:"bloop", url:"www.google.com", expiration_date:Date.today, user_id:user.id})
      get "/api/question_cards", {}, { "Accept" => "application/json" }
      expect(response.status).to eq 200
    end
  end
  
end


