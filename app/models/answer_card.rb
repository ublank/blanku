class AnswerCard < ActiveRecord::Base
  belongs_to(:user)
  belongs_to(:question_card)
end
