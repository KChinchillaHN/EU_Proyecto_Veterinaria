class AddBreedToPets < ActiveRecord::Migration
  def change
  	add_column :pets, :breed, :string
  	add_column :pets, :type_pet, :string

  end
end
