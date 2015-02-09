# require 'tk'

class UsersController < ApplicationController
  # def index
  # end
  #
  # def show
  # end

  def create
    # this can be moved to the front end
    # if params["password"].length <= 7
    #   @notice = "Password must be more than 7 characters! BlankU!"
    #
    # else

		stuff = User.create({
 			fname: params["fname"],
 			lname: params["lname"],
 			email: params["email"],
 			password: params["password"],
 			image_url: params["image_url"]
 		})

    	# if @user.save
      # # Deliver the signup email
      # 		UserNotifier.send_signup_email(@user).deliver
      # 		redirect_to(@user, :notice => 'User created')
    	# else
      # 		response
    	# end

    # end

  end

end
