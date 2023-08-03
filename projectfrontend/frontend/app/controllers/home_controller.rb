class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    session.clear
    if params[:query].present?
      @results = search_solr(params[:query])
    else
      @results = []
    end

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

  # def create_official
  #   @form_data = FormDatum.new(session[:form_data] || {})
  #   @address_data = AddressDatum.new(session[:address_data] || {})
  #   @official_data = OfficialDatum.new(official_params)

  #   if @official_data.valid?
  #     # Save the records to the database
  #     # Assuming you have defined these models and their associations.
  #     @form_data.save
  #     @address_data.save
  #     @official_data.save
  #     solr = RSolr.connect(url: 'http://localhost:8983/solr/forms')
      
  #     # solr.add(@form_data.attributes)
  #     # solr.commit
  #     # solr.add(@address_data.attributes)
  #     # solr.commit
  #     #  solr.add(@official_data.attributes)
  #     #  solr.commit
      
  #     solr.add([
  #     @form_data.attributes.merge(id: @form_data.id),
  #     @address_data.attributes.merge(id: @address_data.id),
  #     @official_data.attributes.merge(id: @official_data.id)
  #   ])
  #   solr.commit

  #     # Commit the changes to Solr
     

  #     # Clear session data after successful submission
  #     session[:form_data] = nil
  #     session[:address_data] = nil
  #     session[:official_data] = nil

  #     redirect_to root_path, notice: "Form submitted successfully!"
  #   else
  #     render :official
  #   end
  # end
  def create_official
    @form_data = FormDatum.new(session[:form_data] || {})
    @address_data = AddressDatum.new(session[:address_data] || {})
    @official_data = OfficialDatum.new(official_params)
  
    if @official_data.valid?
      # Save the records to the database
      if @form_data.save && @address_data.save && @official_data.save
        # Add data to Solr
        solr = RSolr.connect(url: 'http://localhost:8983/solr/forms')# Replace 'new_core' with your Solr core name
        solr.add([
          @form_data.attributes.merge(id: @form_data.id),
          @address_data.attributes.merge(id: @address_data.id),
          @official_data.attributes.merge(id: @official_data.id)
        ])
        solr.commit
  
        # Clear session data after successful submission
        session[:form_data] = nil
        session[:address_data] = nil
        session[:official_data] = nil
  
        redirect_to root_path, notice: "Form submitted successfully!"
      else
        # Handle save errors
        render :official
      end
    else
      render :official
    end
  end
  


  private
  def search_solr(query)
    puts "Searching"
    solr = RSolr.connect(url: 'http://localhost:8983/solr/forms')
    puts solr.get('select', params: { q: query })
    response = solr.get('select', params: { q: query })
    puts response
    docs = response['response']['docs']
    puts docs
    return docs
  rescue RSolr::Error::ConnectionRefused => e
    return []
  end

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
