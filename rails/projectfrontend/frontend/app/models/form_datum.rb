class FormDatum < ApplicationRecord
    validates :first_name, :last_name, :email, :phone, :username, :password, :confirm_password,
    :school, :tenth_percentage, :twelfth_percentage, :college, :cgpa, :adhar_card_number,
    :pan_card_number, :profession, :instagram_id, :facebook_id, :twitter_id, :thread_id,
    :whatsapp_number, :father_number, :mother_number, :father_contact, :mother_contact,
    :marital_status, presence: true

validates :password, confirmation: true
validates :adhar_card_number, numericality: { only_integer: true }, length: { is: 12 }, allow_blank: true
validates :whatsapp_number, :father_number, :mother_number, numericality: { only_integer: true }, allow_blank: true
validates :tenth_percentage, :twelfth_percentage, :cgpa, numericality: true, allow_blank: true
end
