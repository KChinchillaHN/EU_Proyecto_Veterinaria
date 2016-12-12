class AppointmentsController < ApplicationController
  def new
  	@pet = Pet.find(params[:pet_id])
  	@appointment = @pet.appointments.build
  end

  def create
  	@pet = Pet.find(params[:pet_id])
  	@appointment = @pet.appointments.build(appointment_params)
  	if @appointment.save
  		redirect_to @pet
  	else
  		render :new
  	end
  end

  def show
    @pet = Pet.find(params[:pet_id])
    @appointment = Appointment.find(params[:id])
    @doctor = Doctor.find(@current_user.id)
  end

  def edit
    @pet = Pet.find(params[:pet_id])
    @appointment = Appointment.find(params[:id])
    @doctor = Doctor.find(@current_user.id)
  end

  def update
    @pet = Pet.find(params[:pet_id])
    @appointment = Appointment.find(params[:id])
    @doctor = Doctor.find(@current_user.id)
    if @appointment.update_attributes(appointment_params)
      redirect_to @pet
    else
      render :edit
    end
  end

  protected

  def appointment_params
  	params.require(:appointment).permit(:description, :amount)
  end

end
