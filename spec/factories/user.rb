FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "john.#{n}@doe.local" }
    password { 'testing' }
  end
end