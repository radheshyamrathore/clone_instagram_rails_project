class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: user_params[:email])
  
  if @user && @user.authenticate(user_params[:password])
   
    session[:user_id] = @user.id
    flash[:notice]="Login successful"
    redirect_to @user
  else
    flash[:notice]="Invalid email or Password"
    redirect_to '/login'
  end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice]="Logged Out"
    redirect_to '/login'
  end

  private
    def user_params
      params.require(:user).permit(:password, :email)
    end
end