require 'rails_helper'

RSpec.describe Appointment, :type => :model do
  context 'valid attributes' do
    it 'valid' do
      expect(build(:appointment)).to be_valid
    end
  end

  context 'missing user' do
    it 'invalid' do
      expect(build(:appointment, user: nil)).not_to be_valid
    end
  end

  context 'missing schedule' do
    it 'invalid' do
      expect(build(:appointment, schedule: nil)).not_to be_valid
    end
  end

  context 'same schedule and user exists' do
    it 'invalid' do
      created = create(:appointment)
      expect(build(:appointment, user: created.user, schedule: created.schedule)).not_to be_valid
    end
  end

  context 'quota exceeded' do
    it 'invalid' do
      schedule = create(:doctor_schedule)
      Appointment::MAX_QUOTA_PER_SCHEDULE.times do
        create(:appointment, schedule: schedule)
      end
      schedule.reload

      expect(build(:appointment, schedule: schedule)).not_to be_valid
    end
  end

  context 'schedule going to start in / less than 30 mins' do
    it 'invalid' do
      schedule = build(:doctor_schedule, from: Time.now.utc + 5.minutes, until: Time.now.utc + 2.hour)
      expect(build(:appointment, schedule: schedule)).not_to be_valid
    end
  end
end