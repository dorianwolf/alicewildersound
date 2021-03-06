class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_name(params[:name])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_root_path
    else
      redirect_to login_path, notice: 'Name or Password incorrect'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out'
  end

end
