class DhcpTypesController < ApplicationController
  before_action :set_dhcp_type, only: [:show, :edit, :update, :destroy]

  # GET /dhcp_types
  # GET /dhcp_types.json
  def index
    @dhcp_types = DhcpType.all
  end

  # GET /dhcp_types/1
  # GET /dhcp_types/1.json
  def show
  end

  # GET /dhcp_types/new
  def new
    @dhcp_type = DhcpType.new
  end

  # GET /dhcp_types/1/edit
  def edit
  end

  # POST /dhcp_types
  # POST /dhcp_types.json
  def create
    @dhcp_type = DhcpType.new(dhcp_type_params)

    respond_to do |format|
      if @dhcp_type.save
        format.html { redirect_to @dhcp_type, notice: 'Dhcp type was successfully created.' }
        format.json { render :show, status: :created, location: @dhcp_type }
      else
        format.html { render :new }
        format.json { render json: @dhcp_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dhcp_types/1
  # PATCH/PUT /dhcp_types/1.json
  def update
    respond_to do |format|
      if @dhcp_type.update(dhcp_type_params)
        format.html { redirect_to @dhcp_type, notice: 'Dhcp type was successfully updated.' }
        format.json { render :show, status: :ok, location: @dhcp_type }
      else
        format.html { render :edit }
        format.json { render json: @dhcp_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dhcp_types/1
  # DELETE /dhcp_types/1.json
  def destroy
    @dhcp_type.destroy
    respond_to do |format|
      format.html { redirect_to dhcp_types_url, notice: 'Dhcp type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dhcp_type
      @dhcp_type = DhcpType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dhcp_type_params
      params.require(:dhcp_type).permit(:name, :managed, :reservable, :leasable)
    end
end
