class Timesheet < ActiveRecord::Base
    belongs_to :user
    has_many :timesheet_payments
    has_many :employees, :through => :timesheet_payments
    
    accepts_nested_attributes_for :timesheet_payments,
            :reject_if => :all_blank,
            :allow_destroy => true
    accepts_nested_attributes_for :employees   
end
