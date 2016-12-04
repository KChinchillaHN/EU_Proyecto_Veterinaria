class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.text :description
      t.decimal :amount
      t.integer :pet_id

      t.timestamps
    end
  end
end
