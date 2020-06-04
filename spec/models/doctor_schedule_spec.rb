require 'rails_helper'

RSpec.describe DoctorSchedule, :type => :model do
  context 'valid attributes' do
    it 'valid' do
      expect(build(:doctor_schedule)).to be_valid
    end
  end

  context 'invalid doctor' do
    it 'invalid' do
      expect(build(:doctor_schedule, doctor: nil)).not_to be_valid
    end
  end

  context 'from > until' do
    it 'invalid' do
      expect(build(:doctor_schedule, from: Time.now.utc, until: Time.now.utc - 1.second)).not_to be_valid
    end
  end
end