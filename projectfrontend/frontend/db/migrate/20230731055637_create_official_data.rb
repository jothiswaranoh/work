class CreateOfficialData < ActiveRecord::Migration[7.0]
  def change
    create_table :official_data do |t|
      t.string :company
      t.string :role
      t.string :employee_id
      t.string :employee_mail_id
      t.string :laptop_serial
      t.string :laptop_model
      t.string :laptop_brand
      t.string :laptop_mac
      t.string :hoodies
      t.string :experience
      t.string :account_number
      t.string :bank_name
      t.string :branch
      t.string :ifsc_code
      t.string :account_holder_name

      t.timestamps
    end
  end
end
