class AddColumnsAnimalsPets < ActiveRecord::Migration
  def change
  		add_column :animals, :name, :string
  		add_column :animals, :breed, :string
  		add_column :pets, :animal_id, :integer
  end
end
