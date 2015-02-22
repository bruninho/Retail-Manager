class TimesheetPayment < ActiveRecord::Base
    belongs_to :employee
    belongs_to :timesheet
end
