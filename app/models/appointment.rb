class Appointment < ActiveRecord::Base
	belongs_to :pet
	belongs_to :doctor
	validates_presence_of :description, :amount, :pet_id
	validates_numericality_of :amount, greater_than: 0
	
end
