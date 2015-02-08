# require 'tk'

class UsersController < ApplicationController
  def index
  end

  def show
  end

  def create

    pw = params["password"]
    
    if pw.length <= 7
      @notice = "Password must be more than 7 characters! BlankU!"
      
    else
		stuff = User.create({
 			fname: params["fname"],
 			lname: params["lname"],
 			email: params["email"],
 			password: params["password"],
 			image_url: params["image_url"]
 			})
		@user = stuff

    	if @user.save
      # Deliver the signup email
      		UserNotifier.send_signup_email(@user).deliver
      		redirect_to(@user, :notice => 'User created')
    	else
      		render :action => 'new'
    	end

    end

	end

end


