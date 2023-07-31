class HomeController < ApplicationController
  def index
    session.clear
  end

  def personal
    @form_data = FormDatum.new(session[:form_data] || {})
   
  end

  def address
    @address_data = AddressDatum.new(session[:address_data] || {})
  end

  def official
    @official_data = OfficialDatum.new(session[:official_data] || {})
  end

  def create_personal
    @form_data = FormDatum.new(personal_params)
    puts "avobve if"

    if @form_data.valid?
      puts "If"
      session[:form_data] = @form_data.attributes
      redirect_to address_path
    else
      puts "else"
      render :personal
    end
  end

  def create_address
    @address_data = AddressDatum.new(address_params)

    if @address_data.valid?
      session[:address_data] = @address_data.attributes
      redirect_to official_path
    else
      render :address
    end
  end

  def create_official
    @form_data = FormDatum.new(session[:form_data] || {})
    @address_data = AddressDatum.new(session[:address_data] || {})
    @official_data = OfficialDatum.new(official_params)

    if @official_data.valid?
      # Save the records to the database
      # Assuming you have defined these models and their associations.
      @form_data.save
      @address_data.save
      @official_data.save

      # Clear session data after successful submission
      session[:form_data] = nil
      session[:address_data] = nil
      session[:official_data] = nil

      redirect_to root_path, notice: "Form submitted successfully!"
    else
      render :official
    end
  end

  private

  def personal_params
    params.require(:form_datum).permit(
      :first_name, :last_name, :email, :phone, :username, :password, :confirm_password,
      :school, :tenth_percentage, :twelfth_percentage, :college, :cgpa, :adhar_card_number,
      :pan_card_number, :profession, :instagram_id, :facebook_id, :twitter_id, :thread_id,
      :whatsapp_number, :father_number, :mother_number, :father_contact, :mother_contact,
      :marital_status
    )
  end

  def address_params
    params.require(:address_datum).permit(
      :door_number, :floor_number, :building_name, :street_name, :area, :post,
      :village_town, :pincode, :landmark, :city, :district, :state, :country, :continent, :current_address
    )
  end

  def official_params
    params.require(:official_datum).permit(
      :company, :role, :employee_id, :employee_mail_id, :laptop_serial, :laptop_model, :laptop_brand, :laptop_mac,
      :hoodies, :experience, :account_number, :bank_name, :branch, :ifsc_code, :account_holder_name
    )
  end
end
