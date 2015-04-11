class Payroll < ActiveRecord::Base
	belongs_to :user
	has_many :timesheets
	accepts_nested_attributes_for :timesheets
end
