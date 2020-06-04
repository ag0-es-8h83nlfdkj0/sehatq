class DoctorsController < ApplicationController
  def index
    doctors = Doctor.all

    render locals: { doctors: doctors } 
  end
end