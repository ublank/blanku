require 'rails_helper'

describe User do

  describe "when a user creates many question cards" do
    it "will be able to reference them by calling #question_cards" do
      user = User.create({fname:"Bob", lname:"Smith", email:"bob@bob.com", password:"123"})
      QuestionCard.create({user_id:user.id, question_text:"some text", url:"www.google.com"})
      QuestionCard.create({user_id:user.id, question_text:"some text", url:"www.google.com"})
      expect(user.question_cards.length).to be(2)
    end

  end

end


