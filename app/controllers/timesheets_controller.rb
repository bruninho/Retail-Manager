class TimesheetsController < ApplicationController
  before_action :logged_in_user

  def index

    #display all timesheets reports to admin user
    if current_user.admin?
      @timesheet = Timesheet.all
      #display sales only for current user
    else
      @timesheet = current_user.timesheets
    end
  end

  def new
    @employee = current_user.employees.first
    @timesheet = Timesheet.new
    @timesheet.employee = @employee
  end

  def create
      @timesheet = current_user.timesheets.new(timesheet_params)

    respond_to do |format|
      if @timesheet.save
        flash[:success] = 'Timesheet was successfully sent.'
        format.html { redirect_to @timesheet }
        format.json { render :show, status: :created, location: @timesheet }
      else
        format.html { render :new }
        format.json { render json: @timesheet.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @timesheet = Timesheet.all
  end

  def update
  end

  def destroy
  end

  private

  def timesheet_params
    params.require(:timesheet).permit(:week_no, :basic_hours, :sunday_hours, :employee_id, :user_id)
  end

end
