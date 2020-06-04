class AppointmentsController < ApplicationController
  def create
    permitted = params.permit(:user_id, :schedule_id)
    Appointment.create(permitted)
  end
end
