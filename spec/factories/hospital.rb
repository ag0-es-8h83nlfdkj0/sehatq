FactoryBot.define do
  factory :hospital do
    sequence(:name) { |n| "hospital ##{n}" }
  end
end