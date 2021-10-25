class ApplicationController < ActionController::Base
  before_action :fetch_user

  private
  def fetch_user
    # a person logs in and sets the session[:user_id] as present:
    @current_user = User.find_by :id => session[:user_id] if session[:user_id].present?
    session[:user_id] = nil unless @current_user.present? # Log out non-existent users
  end

  # method to check for login
  def check_for_login
    unless @current_user.present?
      flash[:error] = "You must be logged in"
    redirect_to login_path # unless @current_user.present?
    end
  end

  def check_for_admin
    # if user logged in && an admin - not enough to just be admin
    redirect_to login_path unless (@current_user.present? && @current_user.admin?)    
  
  end
end
