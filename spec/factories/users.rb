require 'faker'

FactoryGirl.define do
  factory :user do
    email                  Faker::Internet.email
    password               "password"
    password_confirmation  "password"
  end

  factory :user_with_enabled_notification, class: User do
    email                  Faker::Internet.email
    password               "password"
    password_confirmation  "password"
    association :setting
  end

  factory :user_with_disabled_notification, class: User do
    email                  Faker::Internet.email
    password               "password"
    password_confirmation  "password"
    association :setting, factory: :setting, enable_notification: false
  end
end
