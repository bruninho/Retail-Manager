class Sale < ActiveRecord::Base
    before_save :set_difference
    
    # calculate cash difference sales and cash&credit taken in
    def set_difference
        self.difference =  (self.cash + self.credit) - self.total
    end
end
