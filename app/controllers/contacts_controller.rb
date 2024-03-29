class ContactsController < ApplicationController
  before_action :set_contact, only: %i[show edit update destroy]
  before_action :authenticate_admin, only: %i[index show edit destroy update]
  before_action :set_contact, only: [:show, :edit, :update, :destroy]


  def export
    contacts = Contact.all
    respond_to do |format|
      format.csv {send_data contacts.to_csv, filename: "contacts-#{Date.today}.csv"}
    end
  
  end

  # GET /contacts or /contacts.json
  def index
    @contacts = Contact.all
  end

  # GET /contacts/1 or /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
    @publication = Publication.find(params[:publication_id]) if params[:publication_id].present?
    puts "Publication ID in new action: #{@publication&.id}"

  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts or /contacts.json
  def create
    @contact = Contact.new(contact_params)


  respond_to do |format|
      if @contact.save
        format.html { redirect_to publications_path, notice: "Cotización enviada." }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1 or /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to contacts_url, notice: "Contact was successfully updated." }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1 or /contacts/1.json
  def destroy
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to contacts_url, notice: "Contact was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_contact
    if params[:id] != "export_data"
      @contact = Contact.find(params[:id])
    end
  end

  # Only allow a list of trusted parameters through.
  def contact_params
    params.require(:contact).permit(:name, :lastName, :phone, :email, :content, :locality_id, :publication_id)
  end
end