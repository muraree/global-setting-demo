class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :setting
  
  def can_send_notification?
    setting.try(:enable_notification) && setting.try(:email).present?
  end
end
