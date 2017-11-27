class OsVersionsController < ApplicationController
  before_action :set_os_version, only: [:show, :edit, :update, :destroy]

  # GET /os_versions
  # GET /os_versions.json
  def index
    @os_versions = OsVersion.all
  end

  # GET /os_versions/1
  # GET /os_versions/1.json
  def show
  end

  # GET /os_versions/new
  def new
    @os_version = OsVersion.new
  end

  # GET /os_versions/1/edit
  def edit
  end

  # POST /os_versions
  # POST /os_versions.json
  def create
    @os_version = OsVersion.new(os_version_params)

    respond_to do |format|
      if @os_version.save
        format.html { redirect_to @os_version, notice: 'Os version was successfully created.' }
        format.json { render :show, status: :created, location: @os_version }
      else
        format.html { render :new }
        format.json { render json: @os_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /os_versions/1
  # PATCH/PUT /os_versions/1.json
  def update
    respond_to do |format|
      if @os_version.update(os_version_params)
        format.html { redirect_to @os_version, notice: 'Os version was successfully updated.' }
        format.json { render :show, status: :ok, location: @os_version }
      else
        format.html { render :edit }
        format.json { render json: @os_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /os_versions/1
  # DELETE /os_versions/1.json
  def destroy
    @os_version.destroy
    respond_to do |format|
      format.html { redirect_to os_versions_url, notice: 'Os version was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_os_version
      @os_version = OsVersion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def os_version_params
      params.require(:os_version).permit(:name, :os_product_id, :version, :release, :end_of_life)
    end
end
