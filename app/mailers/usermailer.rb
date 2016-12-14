class Usermailer < ActionMailer::Base
	default from: 'veterinariachansey@hotmail.com'
	def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Bienvenido a la Familia Veterinaria')
  end

	def create_appointment(user, appointment, pet)
    @user = user
    @appointment = appointment
    @pet = pet
    mail(to: @user.email, subject: 'Nueva Cita Programada')
  end

end
