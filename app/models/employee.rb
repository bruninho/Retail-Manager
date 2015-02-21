class Employee < ActiveRecord::Base
    belongs_to :user
    has_and_belongs_to_many :timesheets, :join_table => :emp_timesheet
    
    validates :pps_no, :fname, :lname, :dob, :address, 
              :ph_number, :basic_rop, :sunday_bh_rop, :email,
              :date_joined, presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 }, 
			  format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

end
