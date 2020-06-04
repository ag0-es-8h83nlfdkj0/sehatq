FactoryBot.define do
  factory :appointment do
    user { build(:user) }
    schedule { build(:doctor_schedule) }
  end
end