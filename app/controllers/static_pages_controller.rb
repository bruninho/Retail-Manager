class StaticPagesController < ApplicationController
    before_action :logged_in_user
    before_action :set_feed, only: [:home, :offer, :report]
    
  def home
  end

  def offer
  end

  def report
  end
    
    def set_feed 
        @messages = Message.where(:receiver => current_user.id).paginate(page: params[:page], :per_page => 4)
        @user = User.all
    end
end
