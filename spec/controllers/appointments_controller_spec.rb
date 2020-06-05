require "rails_helper"

RSpec.describe AppointmentsController, :type => :request do
  let(:user) { create(:user) }
  let(:schedule) { create(:doctor_schedule) }

  before do
    sign_in user
  end

  describe '#create' do
    context 'on appointment was created' do
      it 'redirect to schedule with flash message' do
        post(appointments_path(user_id: user.id, schedule_id: schedule.id))
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(schedule_path(id: schedule.id))
        expect(response.request.flash[:message]).to eq('Appointment created')
      end
    end

    context 'on appointment was not created' do
      it 'redirect back with error in flash message' do
        create(:appointment, user: user, schedule: schedule)
        post(appointments_path(user_id: user.id, schedule_id: schedule.id))
        expect(response).to have_http_status(302)
        expect(response).not_to redirect_to(schedule_path(id: schedule.id))
        expect(response.request.flash[:error]).not_to be_nil
      end
    end

    context 'unauthenticated access' do
        it 'redirected to sign_in' do
          sign_out user
          post(appointments_path(user_id: user.id, schedule_id: schedule.id))
          expect(response).to have_http_status(302)
          expect(response).to redirect_to(new_user_session_path)
        end
    end
  end
end