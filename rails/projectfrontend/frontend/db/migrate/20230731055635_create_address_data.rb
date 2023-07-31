class CreateAddressData < ActiveRecord::Migration[7.0]
  def change
    create_table :address_data do |t|
      t.string :door_number
      t.string :floor_number
      t.string :building_name
      t.string :street_name
      t.string :area
      t.string :post
      t.string :village_town
      t.string :pincode
      t.string :landmark
      t.string :city
      t.string :district
      t.string :state
      t.string :country
      t.string :continent
      t.string :current_address

      t.timestamps
    end
  end
end
