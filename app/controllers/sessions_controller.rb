class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.find_by_username(params[:session][:username])
    if user &&  user.authenticate(params[:session][:password]) && user.is_admin?
      sign_in user
      redirect_to users_path
    elsif user &&  user.authenticate(params[:session][:password])
      flash.now[:error] = "Need Admin privileges to login"
      render 'new'
    else
      flash.now[:error] = "Invalid username/password combo"
      render 'new'
    end
  end
  
  def destroy
    sign_out
    redirect_to root_url
  end
  
end
