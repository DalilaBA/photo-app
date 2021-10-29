class PlansController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  # before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    @plans = Plan.all
  end

  # GET /products/1 or /products/1.json
  def show
    @plan = Plan.find(params[:id])
  end

  # GET /products/new
  def new
    @plan = Plan.new
  end

  # GET /products/1/edit
  def edit
    @plan = Plan.find(params[:id])

  end

  # POST /products or /products.json
  def create
    @plan = Plan.new(product_params)

    respond_to do |format|
      if @plan.save
        format.html { redirect_to @plan, notice: "Plan was successfully created." }
        format.json { render :show, status: :created, location: @plan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @plan.update(plan_params)
        format.html { redirect_to @plan, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @plan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @plan.destroy
    respond_to do |format|
      format.html { redirect_to plans_url, notice: "Plan was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_product
    #   @plan = Plan.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:plan).permit(:name, :price)
    end
end
