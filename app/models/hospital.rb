class Hospital < ApplicationRecord
  has_many :hospital_doctors
  has_many :doctors, through: :hospital_doctors
end
