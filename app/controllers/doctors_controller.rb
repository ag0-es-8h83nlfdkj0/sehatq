class DoctorsController < ApplicationController
  before_action :authenticate_user!

  include TimeHelper

  def index
    doctors = Doctor.includes(:hospitals, :schedules).all

    render locals: { doctors: doctors } 
  end
end