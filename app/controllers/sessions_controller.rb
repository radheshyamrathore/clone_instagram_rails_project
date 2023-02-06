# frozen_string_literal: true

class SessionsController < ApplicationController # rubocop:disable Style/Documentation
  def new
    if logged_in?
      flash[:danger] = "you are logged in please log out."
      redirect_to root_path
    end
  end

  def create
    @user = User.find_by(email: user_params[:email])

    if @user&.authenticate(user_params[:password])

      session[:user_id] = @user.id
      flash[:notice] = 'Login successful'
      redirect_to '/posts'
    else
      flash[:notice] = 'Invalid email or Password'
      redirect_to '/login'
    end
  end

  def destroy
    # session.delete(:user_id)
    # session[:user_id] = nil
    # debugger
    # flash[:notice] = 'Logged Out'
    # redirect_to '/login'
    log_out
    redirect_to "/login"
  end

  private

  def user_params
    params.require(:user).permit(:password, :email)
  end
end
