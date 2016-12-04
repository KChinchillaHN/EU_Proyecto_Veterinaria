class RemoveFieldPets < ActiveRecord::Migration
  def change
  	remove_column :pets, :breed, :string
  	remove_column :pets, :type_pet, :string
  	remove_column :animals, :nombre, :string
  	remove_column :animals, :raza, :string
  end
end