class Employee < ActiveRecord::Base
    belongs_to :user
    
    before_save { self.email.downcase! }
    
    validates :pps_no, :fname, :lname, :dob, :address, 
              :ph_number, :basic_rop, :sunday_bh_rop, :email,
              :date_joined, presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 }, 
			  format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    
    #Add profile picture to employee using Paperclip
	has_attached_file :photo, :styles => { :small => "150x150>" },
	                  :url  => "/assets/employees/:id/:style/:basename.:extension",
	                  :path => ":rails_root/public/assets/employees/:id/:style/:basename.:extension"

	validates_attachment_presence     :photo
	validates_attachment_size         :photo, :less_than    => 5.megabytes
	validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

end
