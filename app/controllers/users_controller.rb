class UsersController < ApplicationController
  def index
  end

  def show
  end

  def create
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


