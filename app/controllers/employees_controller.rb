class EmployeesController < ApplicationController
    before_action :logged_in_user
    before_action :set_employee, only: [:show, :edit, :update, :destroy]
    
    def index 
        @employees = current_user.employees
    end
        
    def show
    end
    
    def new
        @employee = Employee.new
    end

    def edit 
    end
    
    def create 
        @employee = current_user.employees.build(employee_params)   
        respond_to do |format|
          if @employee.save
            flash[:success] = 'Employee was successfully created.'
            format.html { redirect_to @employee } 
            format.json { render :show, status: :created, location: @employee }
          else
            format.html { render :new }
            format.json { render json: @employee.errors, status: :unprocessable_entity }
          end
        end
    end
    
    def update 
        respond_to do |format|
          if @employee.update(employee_params)
            flash[:success] = 'Employee was successfully updated.'
            format.html { redirect_to @employee } 
            format.json { render :show, status: :ok, location: @employee }
          else
            format.html { render :edit }
            format.json { render json: @employee.errors, status: :unprocessable_entity }
          end
        end
    end

    def destroy 
        @employee.destroy
        respond_to do |format|
          flash[:success] = 'Employee was successfully deleted.'     
          format.html { redirect_to employees_url } 
          format.json { head :no_content }
        end
    end

    private
    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params 
      params.require(:employee).permit(:pps_no, :fname, :lname, :dob, :address, :ph_number, :basic_rop, :sunday_bh_rop, :email, :date_joined)
    end
    
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

end
