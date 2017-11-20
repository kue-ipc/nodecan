class NodeModelsController < ApplicationController
  before_action :set_node_model, only: [:show, :edit, :update, :destroy]

  # GET /node_models
  # GET /node_models.json
  def index
    @node_models = NodeModel.all
  end

  # GET /node_models/1
  # GET /node_models/1.json
  def show
  end

  # GET /node_models/new
  def new
    @node_model = NodeModel.new
  end

  # GET /node_models/1/edit
  def edit
  end

  # POST /node_models
  # POST /node_models.json
  def create
    @node_model = NodeModel.new(node_model_params)

    respond_to do |format|
      if @node_model.save
        format.html { redirect_to @node_model, notice: 'Node model was successfully created.' }
        format.json { render :show, status: :created, location: @node_model }
      else
        format.html { render :new }
        format.json { render json: @node_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /node_models/1
  # PATCH/PUT /node_models/1.json
  def update
    respond_to do |format|
      if @node_model.update(node_model_params)
        format.html { redirect_to @node_model, notice: 'Node model was successfully updated.' }
        format.json { render :show, status: :ok, location: @node_model }
      else
        format.html { render :edit }
        format.json { render json: @node_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /node_models/1
  # DELETE /node_models/1.json
  def destroy
    @node_model.destroy
    respond_to do |format|
      format.html { redirect_to node_models_url, notice: 'Node model was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_node_model
      @node_model = NodeModel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def node_model_params
      params.require(:node_model).permit(:name)
    end
end
