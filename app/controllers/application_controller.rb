class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user

  def is_authenticated
    unless current_user
      flash[:danger] = "Credentials Invalid!!"
      redirect_to login_path
    end
  end

  def is_admin
    unless admin_user
      flash[:danger] = "Not Admin!!"
      redirect_to root_path
    end
  end

  def admin_user
    @admin_user ||= Admin.find_by_id(session[:user_id])
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end
end
