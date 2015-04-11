class PayrollsController < ApplicationController
  before_action :set_payroll, only: [:show, :edit, :update, :destroy]

  # GET /payrolls
  # GET /payrolls.json
  def index
    @users = User.all
    if current_user.admin?
      @payrolls = Payroll.all.reorder("id DESC").paginate(page: params[:page], :per_page => 5)
    else
      @payrolls = current_user.payrolls.reorder("id DESC").paginate(page: params[:page], :per_page => 5)
    end 
  end

  # GET /payrolls/1
  # GET /payrolls/1.json
  def show
    @employee = Employee.all
  end

  # GET /payrolls/new
  def new
    @payroll = Payroll.new
    @payroll.timesheets.build
  end

  # GET /payrolls/1/edit
  def edit
  end

  # POST /payrolls
  # POST /payrolls.json
  def create
    @payroll = current_user.payrolls.build(payroll_params)
      
    respond_to do |format|
      if @payroll.save
        flash[:success] = "Report was successfully created."
        format.html { redirect_to @payroll }
        format.json { render :show, status: :created, location: @payroll }
      else
        format.html { render :new }
        format.json { render json: @payroll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payrolls/1
  # PATCH/PUT /payrolls/1.json
  def update
    respond_to do |format|
      if @payroll.update(payroll_params)
        flash[:success] = "Report was successfully updated."
        format.html { redirect_to @payroll }
        format.json { render :show, status: :ok, location: @payroll }
      else
        format.html { render :edit }
        format.json { render json: @payroll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payrolls/1
  # DELETE /payrolls/1.json
  def destroy
    @payroll.destroy
    respond_to do |format|
      flash[:success] = "Report was successfully deleted."
      format.html { redirect_to payrolls_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payroll
      @payroll = Payroll.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payroll_params
params.require(:payroll).permit(:user_id, :date, timesheets_attributes: [:id, :employee_id, :basic_hours, :sunday_hours, :payroll_id])    end
    end

