class Appointment < ActiveRecord::Base
	belongs_to :pet
	belongs_to :doctor
	validates_presence_of :description, :amount, :pet_id
	validates_numericality_of :amount, greater_than: 0

	before_create :get_doctor
	before_update :get_doctor

	protected
	def get_doctor	
		self.doctor_id = @current_user
	end
end
