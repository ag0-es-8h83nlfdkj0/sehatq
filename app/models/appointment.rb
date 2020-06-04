class Appointment < ApplicationRecord
  MAX_QUOTA_PER_SCHEDULE = 10
  SCHEDULED_CLOSED_IN_MINUTES = 30

  belongs_to :user
  belongs_to :schedule, class_name: 'DoctorSchedule', foreign_key: :doctor_schedule_id

  alias_attribute :schedule_id, :doctor_schedule_id

  scope :active, -> { joins(:schedule).where('doctor_schedules.from >= ?', Time.now.utc) }

  validates :schedule, uniqueness: { scope: :user }
  validate :quota_per_schedule
  validate :schedule_closed

  def quota_per_schedule
    return unless schedule

    errors.add(:schedule, :max_appointment_reached) if schedule.appointments.size == MAX_QUOTA_PER_SCHEDULE
  end

  def schedule_closed
    return unless schedule

    diff = (schedule.from - Time.now.utc) / 60
    errors.add(:schedule, :already_closed) if diff <= SCHEDULED_CLOSED_IN_MINUTES
  end
end