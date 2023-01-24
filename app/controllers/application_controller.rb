# rubocop:disable Layout/CommentIndentation
class ApplicationController < ActionController::Base
  helper_method :current_user
  include SessionsHelper

  private

  def logged_in_user
    unless logged_in?
      store_location
      flash[:notice] = "Please log in."
      redirect_to login_url
    end
  end
#     private
  
#     # Finds the User with the ID stored in the session with the key
#     # :current_user_id This is a common way to handle user login in
#     # a Rails application; logging in sets the session value and
#     # logging out removes it.
#     def current_user
#       @_current_user ||= session[:current_user_id] &&
#         User.find_by(id: session[:current_user_id])
#     end
# end
#   def current_user
#     @current_user ||= User.find(session[:user_id]) if session[:user_id]
#   end
end