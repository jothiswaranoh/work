# app/models/address_datum.rb
class AddressDatum < ApplicationRecord
    validates :door_number, :floor_number, :building_name, :street_name, :area, :post,
              :village_town, :pincode, :landmark, :city, :district, :state, :country, :continent, :current_address,
              presence: true
  end
  