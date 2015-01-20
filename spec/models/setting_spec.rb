require 'rails_helper'

RSpec.describe Setting, :type => :model do
  describe 'model validations' do
    it "should require a valid email" do
      expect(FactoryGirl.build(:setting, :email => "invalidemail")).to_not be_valid
    end
  end
end
