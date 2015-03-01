class TimesheetPaymentsController < ApplicationController
    
    def index 
    end
    
    def show 
    end
    
    def new 
        @payment = TimesheetPayment.new
        @timesheet = Timesheet.new
        @employee = Employee.all
    end
    
    def edit 
    end
    
    def create
        @timesheet = Timesheet.build(timesheet_params)
        @payment = TimesheetPayment.new(timesheet_payment_params)
        @payment.timesheet = @timesheet
        
        params[:employee].each do |k,v|
           @payment.employee = Employee.find(k)
        end
        # Create new timesheet_payment
        # New timesheet_payment has two fields - basic_hours and sunday_bh_hours
        # Each timesheet_payment belongs to a timesheet
        # Each timesheet_payment has one employee
        # To create a timesheet_payment we must add the employee, timesheet, basic hours and sunday hours
   # TimesheetPayments.create(timesheet_payment_params)
    end
    
    def update 
        # Update basic_hours and sunday_bh_hours for a specific timesheet_payment
    end
    
    def destroy
    end
    
    
    
    private
    def timesheet_payment_params 
        # add params to be passed in
        params.require(:timesheet_payment).permit(:basic_hours, :sunday_bh_hours)
    end
    
    private
    def timesheet_params 
        params.require(:timesheet).permit(:upload_date)
    end
end
