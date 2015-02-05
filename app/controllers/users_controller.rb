class UsersController < ApplicationController
  def index
  end

  def show
  end

  def create
		User.create({
 			fname: params["fname"],
 			lname: params["lname"],
 			email: params["email"],
 			password: params["password"],
 			image_url: params["image_url"]
 			})
 		redirect_to "/users"
	end
end
