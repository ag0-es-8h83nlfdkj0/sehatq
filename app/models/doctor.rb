class Doctor < ApplicationRecord
  has_many :hospital_doctors
  has_many :hospital, through: :hospital_doctors
end
