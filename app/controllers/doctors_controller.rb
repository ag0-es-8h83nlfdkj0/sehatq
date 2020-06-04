class DoctorsController < ApplicationController
  before_action :authenticate_user!

  def index
    doctors = Doctor.all

    render locals: { doctors: doctors } 
  end
end