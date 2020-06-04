class SchedulesController < ApplicationController
  def show
    schedule = DoctorSchedule.find(params[:id])
    render locals: { schedule: schedule, appointments: schedule.appointments.includes(:user) } 
  rescue ActiveRecord::RecordNotFound
    head :not_found unless schedule
  end
end
