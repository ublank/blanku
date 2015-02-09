# require 'tk'

class UsersController < ApplicationController

  def create
    # put this in front end
    # pw = params["password"]
    #
    # if pw.length <= 7
    #   @notice = "Password must be more than 7 characters! BlankU!"
    #
    # else

    if User.find_by(email: params['email'])
        status = ({Status: 'Error', Message: 'A user with that email already exists'})
    else
      userNew = User.create({
        fname: params["fname"],
        lname: params["lname"],
        email: params["email"],
        password: params["password"],
        image_url: params["image_url"]
      })
      UserNotifier.send_signup_email(userNew).deliver
    end

    render json: status

  end

end
