class Timesheet < ActiveRecord::Base
	belongs_to :payroll
	belongs_to :employee
end
