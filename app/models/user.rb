class User < ActiveRecord::Base
	self.has_secure_password
    self.has_many(:question_cards)
    self.has_many(:answer_cards)

	self.has_secure_token :auth_token
end
