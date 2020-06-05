class AppointmentsController < ApplicationController
  before_action :authenticate_user!

  def create
    permitted = params.permit(:user_id, :schedule_id)
    appointment = Appointment.create(permitted)
    return redirect_to(schedule_path(id: permitted[:schedule_id]), flash: { message: 'Appointment created' }) unless appointment.errors.any?

    redirect_back(fallback_location: root_path, flash: { error: appointment.errors.full_messages.join(', ')})
  end
end
