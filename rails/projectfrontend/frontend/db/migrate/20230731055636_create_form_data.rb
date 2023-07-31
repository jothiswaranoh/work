class CreateFormData < ActiveRecord::Migration[7.0]
  def change
    create_table :form_data do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :username
      t.string :password
      t.string :confirm_password
      t.string :school
      t.float :tenth_percentage
      t.float :twelfth_percentage
      t.string :college
      t.float :cgpa
      t.string :adhar_card_number
      t.string :pan_card_number
      t.string :profession
      t.string :instagram_id
      t.string :facebook_id
      t.string :twitter_id
      t.string :thread_id
      t.string :whatsapp_number
      t.string :father_number
      t.string :mother_number
      t.string :father_contact
      t.string :mother_contact
      t.string :marital_status

      t.timestamps
    end
  end
end
