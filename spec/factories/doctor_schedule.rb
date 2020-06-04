FactoryBot.define do
  factory :doctor_schedule do
    doctor { build(:doctor) }
    from { Time.now.utc + 2.hours }
    add_attribute(:until) { Time.now.utc + 4.hours }
  end
end