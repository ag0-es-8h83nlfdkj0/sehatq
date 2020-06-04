class Appointment < ApplicationRecord
  MAX_QUOTA_PER_SCHEDULE = 10

  belongs_to :user
  belongs_to :schedule, class_name: 'DoctorSchedule', foreign_key: :doctor_schedule_id

  alias_attribute :schedule_id, :doctor_schedule_id

  scope :active, -> { joins(:schedule).where('doctor_schedules.from >= ?', Time.now) }

  validates :schedule, uniqueness: { scope: :user }
  validate :quota_per_schedule

  def quota_per_schedule
    errors.add(:schedule, :max_appointment_reached) if schedule.appointments.size == MAX_QUOTA_PER_SCHEDULE
  end
end