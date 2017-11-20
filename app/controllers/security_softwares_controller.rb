class SecuritySoftwaresController < ApplicationController
  before_action :set_security_software, only: [:show, :edit, :update, :destroy]

  # GET /security_softwares
  # GET /security_softwares.json
  def index
    @security_softwares = SecuritySoftware.all
  end

  # GET /security_softwares/1
  # GET /security_softwares/1.json
  def show
  end

  # GET /security_softwares/new
  def new
    @security_software = SecuritySoftware.new
  end

  # GET /security_softwares/1/edit
  def edit
  end

  # POST /security_softwares
  # POST /security_softwares.json
  def create
    @security_software = SecuritySoftware.new(security_software_params)

    respond_to do |format|
      if @security_software.save
        format.html { redirect_to @security_software, notice: 'Security software was successfully created.' }
        format.json { render :show, status: :created, location: @security_software }
      else
        format.html { render :new }
        format.json { render json: @security_software.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /security_softwares/1
  # PATCH/PUT /security_softwares/1.json
  def update
    respond_to do |format|
      if @security_software.update(security_software_params)
        format.html { redirect_to @security_software, notice: 'Security software was successfully updated.' }
        format.json { render :show, status: :ok, location: @security_software }
      else
        format.html { render :edit }
        format.json { render json: @security_software.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /security_softwares/1
  # DELETE /security_softwares/1.json
  def destroy
    @security_software.destroy
    respond_to do |format|
      format.html { redirect_to security_softwares_url, notice: 'Security software was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_security_software
      @security_software = SecuritySoftware.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def security_software_params
      params.require(:security_software).permit(:name, :has_expiration)
    end
end
