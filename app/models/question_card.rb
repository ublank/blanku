class QuestionCard < ActiveRecord::Base
  self.belongs_to(:user)
  self.has_many(:answer_cards)
end
