class DoctorSchedule < ApplicationRecord
  belongs_to :doctor
  has_many :appointments

  validate :validate_periods

  def validate_periods
    errors.add(:until, :lower_that_from) if from >= self.until
  end
end
