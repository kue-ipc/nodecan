class OsFamiliesController < ApplicationController
  before_action :set_os_family, only: [:show, :edit, :update, :destroy]

  # GET /os_families
  # GET /os_families.json
  def index
    @os_families = OsFamily.all
  end

  # GET /os_families/1
  # GET /os_families/1.json
  def show
  end

  # GET /os_families/new
  def new
    @os_family = OsFamily.new
  end

  # GET /os_families/1/edit
  def edit
  end

  # POST /os_families
  # POST /os_families.json
  def create
    @os_family = OsFamily.new(os_family_params)

    respond_to do |format|
      if @os_family.save
        format.html { redirect_to @os_family, notice: 'Os family was successfully created.' }
        format.json { render :show, status: :created, location: @os_family }
      else
        format.html { render :new }
        format.json { render json: @os_family.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /os_families/1
  # PATCH/PUT /os_families/1.json
  def update
    respond_to do |format|
      if @os_family.update(os_family_params)
        format.html { redirect_to @os_family, notice: 'Os family was successfully updated.' }
        format.json { render :show, status: :ok, location: @os_family }
      else
        format.html { render :edit }
        format.json { render json: @os_family.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /os_families/1
  # DELETE /os_families/1.json
  def destroy
    @os_family.destroy
    respond_to do |format|
      format.html { redirect_to os_families_url, notice: 'Os family was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_os_family
      @os_family = OsFamily.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def os_family_params
      params.require(:os_family).permit(:name, :require_security_software)
    end
end
