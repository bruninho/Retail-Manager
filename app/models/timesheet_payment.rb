class TimesheetPayment < ActiveRecord::Base
    
    belongs_to :employee
    belongs_to :timesheet
    
    accepts_nested_attributes_for :employee,
                                  :reject_if => :all_blank
end
