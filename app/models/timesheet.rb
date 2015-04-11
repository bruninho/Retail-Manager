class Timesheet < ActiveRecord::Base
	belongs_to :payroll
	belongs_to :employee

	validates :employee_id, :basic_hours, :sunday_hours, presence: true
end
