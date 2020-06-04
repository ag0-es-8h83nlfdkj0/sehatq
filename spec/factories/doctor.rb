FactoryBot.define do
  factory :doctor do
    sequence(:name) { |n| "doctor #{n}" }
  end
end