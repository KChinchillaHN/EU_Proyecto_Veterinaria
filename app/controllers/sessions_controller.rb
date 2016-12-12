class SessionsController < ApplicationController
  skip_before_action :authenticate, only: [:new, :create]

  def new
  	if current_user
  		redirect_to profile_path
  	end
  end

  def create
  	email = params[:session][:email]
  	password = params[:session][:password]

  	@doctor = Doctor.find_by_email(email)

  	if @doctor && @doctor.authenticate(password)
  		login(@doctor)
  	else
  		redirect_to login_path, flash: { error: "Email o Password incorrecto"}
  	end
  end

  def destroy
  	logout
  end
end
