class Setting < ActiveRecord::Base
  validates :email, email_format: { message: "doesn't look like an email address" }
  belongs_to :user
end
