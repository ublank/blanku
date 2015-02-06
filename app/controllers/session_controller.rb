class SessionController < ApplicationController
  # def new
  #   render :new
  # end

  def create
  	user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:token] = user.auth_token
      session[:login_error] = nil # "Success"
      redirect_to '/'
	  else
      session[:login_error] = "Login Error"
      redirect_to '/'
    end
  end

  def destroy
  	reset_session
  end

end
