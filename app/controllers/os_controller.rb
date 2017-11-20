class OsController < ApplicationController
  before_action :set_o, only: [:show, :edit, :update, :destroy]

  # GET /os
  # GET /os.json
  def index
    @os = Os.all
  end

  # GET /os/1
  # GET /os/1.json
  def show
  end

  # GET /os/new
  def new
    @o = Os.new
  end

  # GET /os/1/edit
  def edit
  end

  # POST /os
  # POST /os.json
  def create
    @o = Os.new(o_params)

    respond_to do |format|
      if @o.save
        format.html { redirect_to @o, notice: 'Os was successfully created.' }
        format.json { render :show, status: :created, location: @o }
      else
        format.html { render :new }
        format.json { render json: @o.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /os/1
  # PATCH/PUT /os/1.json
  def update
    respond_to do |format|
      if @o.update(o_params)
        format.html { redirect_to @o, notice: 'Os was successfully updated.' }
        format.json { render :show, status: :ok, location: @o }
      else
        format.html { render :edit }
        format.json { render json: @o.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /os/1
  # DELETE /os/1.json
  def destroy
    @o.destroy
    respond_to do |format|
      format.html { redirect_to os_index_url, notice: 'Os was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_o
      @o = Os.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def o_params
      params.require(:o).permit(:name, :os_type_id, :end_of_life)
    end
end
