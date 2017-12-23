class NetworksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_network, only: [:show, :edit, :update, :destroy]

  # GET /networks
  # GET /networks.json
  def index
    @networks = Network.all
  end

  # GET /networks/1
  # GET /networks/1.json
  def show
  end

  # GET /networks/new
  def new
    @network = Network.new
  end

  # GET /networks/1/edit
  def edit
  end

  # POST /networks
  # POST /networks.json
  def create
    @network = Network.new(network_params)

    respond_to do |format|
      if @network.save
        format.html { redirect_to @network, notice: 'Network was successfully created.' }
        format.json { render :show, status: :created, location: @network }
      else
        format.html { render :new }
        format.json { render json: @network.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /networks/1
  # PATCH/PUT /networks/1.json
  def update
    respond_to do |format|
      if @network.update(network_params)
        format.html { redirect_to @network, notice: 'Network was successfully updated.' }
        format.json { render :show, status: :ok, location: @network }
      else
        format.html { render :edit }
        format.json { render json: @network.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /networks/1
  # DELETE /networks/1.json
  def destroy
    @network.destroy
    respond_to do |format|
      format.html { redirect_to networks_url, notice: 'Network was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  private def set_network
    @network = Network.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  private def network_params
    checked_params = params.require(:network).permit(:name, :vlan, :use_auth, :use_ipv4, :use_ipv6, :note,
      ipv4_network: [:id, :network_type, :address, :netmask, :gateway],
      ipv6_network: [:id, :network_type, :address, :netmask, :gateway])

    ipv4_network_params = {
      id: checked_params[:ipv4_network][:id],
      network_type: checked_params[:ipv4_network][:network_type],
      address: checked_params[:ipv4_network][:address] + '/' + checked_params[:ipv4_network][:netmask],
      gateway: checked_params[:ipv4_network][:gateway],
      _destroy: checked_params[:use_ipv4].to_i.zero?,
    }

    ipv6_network_params = {
      id: checked_params[:ipv6_network][:id],
      network_type: checked_params[:ipv6_network][:network_type],
      address: checked_params[:ipv6_network][:address] + '/' + checked_params[:ipv6_network][:netmask],
      gateway: checked_params[:ipv6_network][:gateway],
      _destroy: checked_params[:use_ipv6].to_i.zero?,
    }

    {
      name: checked_params[:name],
      vlan: checked_params[:vlan],
      use_auth: checked_params[:use_auth],
      note: checked_params[:note],
      ip_networks_attributes: [ipv4_network_params, ipv6_network_params],
    }
  end
end
