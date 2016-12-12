class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :authenticate

  def login(doctor)
    session[:doctor_id] = doctor.id
    redirect_to profile_path
  end

  def logout
    reset_session
    redirect_to root_path
  end

  def current_user
    if session[:doctor_id]
      @current_user = Doctor.find(session[:doctor_id])
    end
  end

  def authenticate
    unless current_user
        redirect_to login_path
    end
  end
end