class Special < ActiveRecord::Base
	has_many :pages
	accepts_nested_attributes_for :pages
	validates :title, :start_date, :end_date, presence: true
end
