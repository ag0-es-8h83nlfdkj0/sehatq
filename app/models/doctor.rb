class Doctor < ApplicationRecord
  has_many :hospital_doctors
  has_many :hospitals, through: :hospital_doctors
  has_many :schedules, -> { where('doctor_schedules.from >= ?', Time.now + 30.minutes) }, class_name: 'DoctorSchedule'
end
