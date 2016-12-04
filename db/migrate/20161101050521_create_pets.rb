class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.datetime :born_at
      t.text :observations
      t.text :pet_url

      t.timestamps
    end
  end
end
