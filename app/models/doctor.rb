class Doctor < ActiveRecord::Base
has_secure_password validations: false
has_many :appointments

validates_presence_of :name, :email
validates :email, uniqueness: true

	def sum_of_appointments
		self.appointments.sum(:amount)
	end
end
