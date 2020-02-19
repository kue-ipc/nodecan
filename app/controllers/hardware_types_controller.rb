class HardwareTypesController < ApplicationController
  before_action :set_hardware_type, only: [:show, :edit, :update, :destroy]

  # GET /hardware_types
  # GET /hardware_types.json
  def index
    @hardware_types = HardwareType.all
  end

  # GET /hardware_types/1
  # GET /hardware_types/1.json
  def show
  end

  # GET /hardware_types/new
  def new
    @hardware_type = HardwareType.new
  end

  # GET /hardware_types/1/edit
  def edit
  end

  # POST /hardware_types
  # POST /hardware_types.json
  def create
    @hardware_type = HardwareType.new(hardware_type_params)

    respond_to do |format|
      if @hardware_type.save
        format.html { redirect_to @hardware_type, notice: 'Hardware type was successfully created.' }
        format.json { render :show, status: :created, location: @hardware_type }
      else
        format.html { render :new }
        format.json { render json: @hardware_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hardware_types/1
  # PATCH/PUT /hardware_types/1.json
  def update
    respond_to do |format|
      if @hardware_type.update(hardware_type_params)
        format.html { redirect_to @hardware_type, notice: 'Hardware type was successfully updated.' }
        format.json { render :show, status: :ok, location: @hardware_type }
      else
        format.html { render :edit }
        format.json { render json: @hardware_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hardware_types/1
  # DELETE /hardware_types/1.json
  def destroy
    @hardware_type.destroy
    respond_to do |format|
      format.html { redirect_to hardware_types_url, notice: 'Hardware type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hardware_type
      @hardware_type = HardwareType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hardware_type_params
      params.require(:hardware_type).permit(:code, :name, :description, :category, :order)
    end
end
