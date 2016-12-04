class Pet < ActiveRecord::Base
	belongs_to :owner
	belongs_to :animal
	has_many :appointments
	
	validates_presence_of :name, :born_at
	validates :observations, length: {maximum: 200}

	def sum_of_appointments
		self.appointments.sum(:amount)
	end
end
