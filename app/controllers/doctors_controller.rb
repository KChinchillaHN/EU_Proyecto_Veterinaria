class DoctorsController < ApplicationController
	  skip_before_action :authenticate, only: [:new, :create]
  def new
		 @doctor = Doctor.new	
	end

  def show
    @doctor = Doctor.find(@current_user.id)
  end

	def create
	@doctor = Doctor.new(doctor_params)
  	if @doctor.save 
      Usermailer.welcome_email(@doctor).deliver
  		redirect_to profile_path, notice: "El Doctor se agrego exitosamente" 
  	else
  		flash[:error] = "No se pudo registrar el doctor, Favor corregir los siguientes errores: "
  		render :new
  	end
	end

  def edit
    @doctor = Doctor.find(@current_user.id)
  end

  def update
    @doctor = Doctor.find(@current_user.id)

    if @doctor.update_attributes(doctor_params)
      redirect_to profile_path
    else
       render :edit
    end
  end


	protected
  def doctor_params
  	params.require(:doctor).permit(:name, :email, :password)
  end
end
