class OsTypesController < ApplicationController
  before_action :set_os_type, only: [:show, :edit, :update, :destroy]

  # GET /os_types
  # GET /os_types.json
  def index
    @os_types = OsType.all
  end

  # GET /os_types/1
  # GET /os_types/1.json
  def show
  end

  # GET /os_types/new
  def new
    @os_type = OsType.new
  end

  # GET /os_types/1/edit
  def edit
  end

  # POST /os_types
  # POST /os_types.json
  def create
    @os_type = OsType.new(os_type_params)

    respond_to do |format|
      if @os_type.save
        format.html { redirect_to @os_type, notice: 'Os type was successfully created.' }
        format.json { render :show, status: :created, location: @os_type }
      else
        format.html { render :new }
        format.json { render json: @os_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /os_types/1
  # PATCH/PUT /os_types/1.json
  def update
    respond_to do |format|
      if @os_type.update(os_type_params)
        format.html { redirect_to @os_type, notice: 'Os type was successfully updated.' }
        format.json { render :show, status: :ok, location: @os_type }
      else
        format.html { render :edit }
        format.json { render json: @os_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /os_types/1
  # DELETE /os_types/1.json
  def destroy
    @os_type.destroy
    respond_to do |format|
      format.html { redirect_to os_types_url, notice: 'Os type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_os_type
      @os_type = OsType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def os_type_params
      params.require(:os_type).permit(:name, :require_security_software)
    end
end
