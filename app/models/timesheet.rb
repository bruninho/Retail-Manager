class Timesheet < ActiveRecord::Base
    belongs_to :user
    has_many :employees, :through => :timesheet_payments
    has_many :timesheet_payments
end
