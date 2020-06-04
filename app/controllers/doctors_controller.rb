class DoctorsController < ApplicationController
  before_action :authenticate_user!

  include TimeHelper

  def index
    doctors = Doctor.includes(:hospitals, :schedules).all
    render locals: { doctors: doctors } 
  end

  def show
    doctor = Doctor.find(params[:id])

    render locals: { doctor: doctor } 
  rescue ActiveRecord::RecordNotFound
    head :not_found unless doctor
  end
end