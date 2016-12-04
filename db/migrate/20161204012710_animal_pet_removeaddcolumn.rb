class AnimalPetRemoveaddcolumn < ActiveRecord::Migration
  def change
  	remove_column :animals, :breed, :string
  	add_column :pets, :breed, :string
  end
end
