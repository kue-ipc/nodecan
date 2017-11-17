class NicTypesController < ApplicationController
  before_action :set_nic_type, only: [:show, :edit, :update, :destroy]

  # GET /nic_types
  # GET /nic_types.json
  def index
    @nic_types = NicType.all
  end

  # GET /nic_types/1
  # GET /nic_types/1.json
  def show
  end

  # GET /nic_types/new
  def new
    @nic_type = NicType.new
  end

  # GET /nic_types/1/edit
  def edit
  end

  # POST /nic_types
  # POST /nic_types.json
  def create
    @nic_type = NicType.new(nic_type_params)

    respond_to do |format|
      if @nic_type.save
        format.html { redirect_to @nic_type, notice: 'Nic type was successfully created.' }
        format.json { render :show, status: :created, location: @nic_type }
      else
        format.html { render :new }
        format.json { render json: @nic_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nic_types/1
  # PATCH/PUT /nic_types/1.json
  def update
    respond_to do |format|
      if @nic_type.update(nic_type_params)
        format.html { redirect_to @nic_type, notice: 'Nic type was successfully updated.' }
        format.json { render :show, status: :ok, location: @nic_type }
      else
        format.html { render :edit }
        format.json { render json: @nic_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nic_types/1
  # DELETE /nic_types/1.json
  def destroy
    @nic_type.destroy
    respond_to do |format|
      format.html { redirect_to nic_types_url, notice: 'Nic type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nic_type
      @nic_type = NicType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nic_type_params
      params.require(:nic_type).permit(:name, :allow_laa)
    end
end
