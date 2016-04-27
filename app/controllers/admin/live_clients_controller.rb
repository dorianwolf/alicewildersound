class Admin::LiveClientsController < AdminController
  before_action :set_live_client, only: [:show, :edit, :update, :destroy]

  # GET /live_clients
  # GET /live_clients.json
  def index
    @live_clients = LiveClient.all
  end

  # GET /live_clients/1
  # GET /live_clients/1.json
  def show
  end

  # GET /live_clients/new
  def new
    @live_client = LiveClient.new
  end

  # GET /live_clients/1/edit
  def edit
  end

  # POST /live_clients
  # POST /live_clients.json
  def create
    @live_client = LiveClient.new(live_client_params)

    respond_to do |format|
      if @live_client.save
        format.html { redirect_to admin_live_clients_path, notice: 'Live client was successfully created.' }
        format.json { render :show, status: :created, location: @live_client }
      else
        format.html { render :new }
        format.json { render json: @live_client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /live_clients/1
  # PATCH/PUT /live_clients/1.json
  def update
    respond_to do |format|
      if @live_client.update(live_client_params)
        format.html { redirect_to edit_admin_live_client_path(@live_client), notice: 'Live client was successfully updated.' }
        format.json { render :show, status: :ok, location: @live_client }
      else
        format.html { render :edit }
        format.json { render json: @live_client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /live_clients/1
  # DELETE /live_clients/1.json
  def destroy
    @live_client.destroy
    respond_to do |format|
      format.html { redirect_to admin_live_clients_path, notice: 'Artist deleted' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_live_client
      @live_client = LiveClient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def live_client_params
      params.require(:live_client).permit(:artist, :image, :remote_image_url, :role)
    end
end
