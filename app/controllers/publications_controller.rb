class PublicationsController < ApplicationController
  before_action :set_publication, only: %i[ show edit update destroy ]
  before_action :authenticate_admin, only: %i[new create edit update destroy]

  include Pagy::Backend

  # GET /publications or /publications.json
  def index

    @publications = Publication.all
    @pagy, @publications = pagy(Publication.order(created_at: :desc), items: 12)
  end

  # GET /publications/1 or /publications/1.json
  def show
    @publication = Publication.find(params[:id])
    @contact = Contact.new # Esto inicializa un nuevo objeto Contact vacío para el formulario
  end

  # GET /publications/new
  def new
    @publication = Publication.new
    @products = Product.includes(:client).order(created_at: :desc)
    @clients = Client.all.map { |client| ["#{client.name} #{client.lastName}", client.id] }

  end

  # GET /publications/1/edit
  def edit
    @publication = Publication.new
    @products = Product.includes(:client).order(created_at: :desc)
    @clients = Client.all.map { |client| ["#{client.name} #{client.lastName}", client.id] }
  end

  # POST /publications or /publications.json
  def create
    @publication = Publication.new(publication_params)
    @publication.user_id = current_user.id

    respond_to do |format|
      if @publication.save
        format.html { redirect_to publication_url(@publication), notice: "Publication was successfully created." }
        format.json { render :show, status: :created, location: @publication }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publications/1 or /publications/1.json
  def update
    respond_to do |format|
      if @publication.update(publication_params)
        format.html { redirect_to publication_url(@publication), notice: "Publication was successfully updated." }
        format.json { render :show, status: :ok, location: @publication }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publications/1 or /publications/1.json
  def destroy
    @publication.destroy

    respond_to do |format|
      format.html { redirect_to publications_url, notice: "Publication was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publication
      @publication = Publication.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def publication_params
      params.require(:publication).permit(:description, :product_id, :user_id, images: [])
    end
end
