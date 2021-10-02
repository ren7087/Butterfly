class Message < ApplicationRecord
    after_create_commit { MessageBroadcastJob.perform_later self }
    validates :content, presence: true
    belongs_to :user
    belongs_to :room
    
end
