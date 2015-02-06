class SessionController < ApplicationController
  def new
    render :new
  end

  def create
  	user = User.find_by(email: params[:email])

  	if user && user.authenticate(params[:password])
		redirect_to '/index'
	else
		render :new	
  	end
  end

  def destroy
  	reset_session
  	redirect_to '/login'
  end

end
