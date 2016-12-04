namespace :animals_complete do
	desc "Completa el campo raza en caso de que no se haya elegido"
	task :complete_breed => :environment do
		Pet.where(breed: nil).each do |pet|
			pet.update_attribute :breed, "Raza Pendiente"
		end
	end

	desc "Completa el campo animal en caso de que no se haya elegido"
	task :complete_animal => :environment do
		Pet.where(animal_id: nil).each do |pet|
			pet.update_attribute :animal_id, '5'
		end
	end

end