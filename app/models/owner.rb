class Owner < ActiveRecord::Base
	has_many :pets

	validates_presence_of :name, :last_name, :phone

end
