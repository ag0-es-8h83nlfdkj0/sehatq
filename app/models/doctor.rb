class Doctor < ApplicationRecord
  has_many :hospital_doctors
  has_many :hospitals, through: :hospital_doctors
end
