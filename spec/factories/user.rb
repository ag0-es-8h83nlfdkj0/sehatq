FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "john.#{n}@doe.local" }
    sequence(:name) { |n| "john #{n}" }
    password { 'testing' }
  end
end