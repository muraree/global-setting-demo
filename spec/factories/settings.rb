FactoryGirl.define do
  factory :setting do
    email Faker::Internet.email
    enable_notification true
  end

  factory :setting_with_user, class: Setting do
    email Faker::Internet.email
    enable_notification true
    association :user, :factory => :user
  end

  factory :disable_notification_setting, class: Setting do
    email Faker::Internet.email
    enable_notification false
  end
end
