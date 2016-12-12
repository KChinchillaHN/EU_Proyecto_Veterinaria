class Pet < ActiveRecord::Base
	belongs_to :owner
	belongs_to :animal
	has_many :appointments
	
	validates_presence_of :name
	validates :observations, length: {maximum: 200}

	before_create :check_photo
	before_update :check_photo

	def sum_of_appointments
		self.appointments.sum(:amount)
	end

	protected

	def check_photo
		if pet_url.blank?
			self.pet_url = "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Pou.png/220px-Pou.png"
		end
	end

end
