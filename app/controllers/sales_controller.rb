class SalesController < ApplicationController
    before_action :set_sale, only: [:show, :edit, :update, :destroy]
    before_action :logged_in_user

  # GET /sales
  # GET /sales.json
  def index    
    @sales = current_user.sales
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
  end

  # GET /sales/new
  def new
    @sale = Sale.new
  end

  # GET /sales/1/edit
  def edit
  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = current_user.sales.build(sale_params)
     
    respond_to do |format|
      if @sale.save
        flash[:success] = "Report was successfully created."
        format.html { redirect_to @sale } #, notice: 'Report was successfully created.' }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        flash[:success] = 'Report was successfully updated.'
        format.html { redirect_to @sale } #, notice:  'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      flash[:success] = 'Report was successfully deleted.'     
      format.html { redirect_to sales_url } #, notice: 'Report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    private
    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(:total, :profit, :credit, :cash, :difference)
    end
end
