class Sale < ActiveRecord::Base
    before_save :set_difference
    belongs_to :user
    validates :user_id, :total, :profit, :credit, :cash, presence: true
    
    # calculate cash difference sales and cash&credit taken in
    def set_difference
        self.difference =  (self.cash + self.credit) - self.total
    end

    # download sale as xls file
    def self.to_csv(options = {})
    	CSV.generate(options) do |csv|
    		csv << column_names
    		all.each do |sale|
    			csv << sale.attributes.values_at(*column_names)
    		end
    	end
    end

end
