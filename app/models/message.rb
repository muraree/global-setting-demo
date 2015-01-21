class Message < ActiveRecord::Base
  belongs_to :user
  after_create :clear_message
  
  private
  
  def clear_message
    Rails.cache.delete("messages_#{self.user.try(:id)}")
  end
end
