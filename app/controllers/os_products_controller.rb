class OsProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_os_product, only: [:show, :edit, :update, :destroy]

  # GET /os_products
  # GET /os_products.json
  def index
    @os_products = OsProduct.all
  end

  # GET /os_products/1
  # GET /os_products/1.json
  def show
  end

  # GET /os_products/new
  def new
    @os_product = OsProduct.new
  end

  # GET /os_products/1/edit
  def edit
  end

  # POST /os_products
  # POST /os_products.json
  def create
    @os_product = OsProduct.new(os_product_params)

    respond_to do |format|
      if @os_product.save
        format.html { redirect_to @os_product, notice: 'Os product was successfully created.' }
        format.json { render :show, status: :created, location: @os_product }
      else
        format.html { render :new }
        format.json { render json: @os_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /os_products/1
  # PATCH/PUT /os_products/1.json
  def update
    respond_to do |format|
      if @os_product.update(os_product_params)
        format.html { redirect_to @os_product, notice: 'Os product was successfully updated.' }
        format.json { render :show, status: :ok, location: @os_product }
      else
        format.html { render :edit }
        format.json { render json: @os_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /os_products/1
  # DELETE /os_products/1.json
  def destroy
    @os_product.destroy
    respond_to do |format|
      format.html { redirect_to os_products_url, notice: 'Os product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_os_product
      @os_product = OsProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def os_product_params
      params.require(:os_product).permit(:name, :os_family_id)
    end
end
