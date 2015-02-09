class SessionsController < ApplicationController
  # def new
  #   render :new
  # end

  def create 
  	user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:error] = nil # "Success"
      render json: user
    else
      session[:error] = "Login Error"
    end
  end

  def destroy
  	reset_session
  end

end
