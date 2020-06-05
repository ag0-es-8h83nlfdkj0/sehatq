require "rails_helper"

RSpec.describe SchedulesController, :type => :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe '#show' do
    let(:schedule) { create(:doctor_schedule) }

    context 'record found' do
      it 'respond with 200' do
        get(schedule_path(id: schedule.id))
        expect(response).to have_http_status(200)
      end
    end

    context 'record not found' do
      it 'respond with 404' do
        get(schedule_path(id: 'invalid'))
        expect(response).to have_http_status(404)
      end
    end

    context 'unauthenticated access' do
        it 'redirected to sign_in' do
          sign_out user
          get(schedule_path(id: schedule.id))
          expect(response).to have_http_status(302)
          expect(response).to redirect_to(new_user_session_path)
        end
    end
  end
end