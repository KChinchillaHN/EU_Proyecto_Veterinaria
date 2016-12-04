class Animal < ActiveRecord::Base
	has_many :pets
	validates_presence_of :name, :breed

end
