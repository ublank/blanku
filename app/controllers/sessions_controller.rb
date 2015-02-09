class SessionsController < ApplicationController
  # def new
  #   render :new
  # end

  def create
    binding.pry
  	user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      response.headers["Content-Type"] = "application/json"
      response.body = JSON.generate({Login: 'Success'})
	  else
      response.headers["Content-Type"] = "application/json"
      response.body = JSON.generate({Login: 'Error'})
    end
  end

  def destroy
  	reset_session
  end

end
