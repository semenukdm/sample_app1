class SessionsController < ApplicationController

  def new
  end
  
  def destroy
    log_out   
    redirect_to root_url
  end

  def create
  user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
           #params[:session][:remember_me] == '1' ? remember(user) : forget(user)
           redirect_back_or user
    #  remember user  
    else
      flash.now[:danger] = 'Invalid email/password combination' # Не совсем верно!
    render 'new'
  	end

  
end
end
