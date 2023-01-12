class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(params[:user_name])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    flash[:notice]="Login successful"
    redirect_to '/'
  else
    flash[:notice]="Invalid user_name or Password"
    redirect_to '/login'
  end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice]="Logged Out"
    redirect_to '/login'
  end
end