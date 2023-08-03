# app/models/official_datum.rb
class OfficialDatum < ApplicationRecord
    validates :company, :role, :employee_id, :employee_mail_id, :laptop_serial, :laptop_model, :laptop_brand, :laptop_mac,
              :hoodies, :experience, :account_number, :bank_name, :branch, :ifsc_code, :account_holder_name,
              presence: true
  end
  