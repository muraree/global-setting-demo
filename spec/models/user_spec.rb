require 'rails_helper'

RSpec.describe User, :type => :model do
  
  it "should have gloabl setting enable for message" do
    expect(FactoryGirl.build(:user_with_enabled_notification).can_send_notification?).to be true
  end

  it "should have gloabl setting disable for message" do
    expect(FactoryGirl.build(:user_with_disabled_notification).can_send_notification?).not_to be true
  end

end
