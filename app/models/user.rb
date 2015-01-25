class User < ActiveRecord::Base
	before_save { email.downcase! } 												#downcase email before inserting on database
	validates :name, 	presence: true, length: { maximum: 50 }						#ensure that name is present & length is valid when new user is created
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i 		#email formatting code
	validates :email, 	presence: true, length: { maximum: 255 },					#ensure that email is present & length is valid when new user is created
						format: { with: VALID_EMAIL_REGEX },						#validates email formatting	
						uniqueness: { case_sensitive: false }						#unique email address validation
	has_secure_password
	validates :password, length: { minimum: 6 }
end
