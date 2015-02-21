class Message < ActiveRecord::Base
    belongs_to :user
    validates :user_id, presence: true
    validates :receiver, :subject, :content, presence: true
end
