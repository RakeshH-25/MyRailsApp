class ApplicationController < ActionController::Base
  include CurrentCart
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :current_user
  
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def set_department_list
      @departments = Department.all
  end

  def require_admin_login
    unless session[:admin]
      redirect_to log_in_url, notice: "Please log in Admin"  
    else
      session[:admin]
    end
  end

  def require_login
      unless session[:user_id]
        redirect_to log_in_url, notice: "User,Please log in"
      end
    end

end
