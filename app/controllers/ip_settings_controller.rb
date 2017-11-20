class IpSettingsController < ApplicationController
  before_action :set_ip_setting, only: [:show, :edit, :update, :destroy]

  # GET /ip_settings
  # GET /ip_settings.json
  def index
    @ip_settings = IpSetting.all
  end

  # GET /ip_settings/1
  # GET /ip_settings/1.json
  def show
  end

  # GET /ip_settings/new
  def new
    @ip_setting = IpSetting.new
  end

  # GET /ip_settings/1/edit
  def edit
  end

  # POST /ip_settings
  # POST /ip_settings.json
  def create
    @ip_setting = IpSetting.new(ip_setting_params)

    respond_to do |format|
      if @ip_setting.save
        format.html { redirect_to @ip_setting, notice: 'Ip setting was successfully created.' }
        format.json { render :show, status: :created, location: @ip_setting }
      else
        format.html { render :new }
        format.json { render json: @ip_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ip_settings/1
  # PATCH/PUT /ip_settings/1.json
  def update
    respond_to do |format|
      if @ip_setting.update(ip_setting_params)
        format.html { redirect_to @ip_setting, notice: 'Ip setting was successfully updated.' }
        format.json { render :show, status: :ok, location: @ip_setting }
      else
        format.html { render :edit }
        format.json { render json: @ip_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ip_settings/1
  # DELETE /ip_settings/1.json
  def destroy
    @ip_setting.destroy
    respond_to do |format|
      format.html { redirect_to ip_settings_url, notice: 'Ip setting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ip_setting
      @ip_setting = IpSetting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ip_setting_params
      params.require(:ip_setting).permit(:name, :require_address, :require_dhcp, :register_reservation)
    end
end
