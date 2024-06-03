class AddPhysiciansToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :physician, :string
    add_column :appointments, :patient, :string
  end
end
