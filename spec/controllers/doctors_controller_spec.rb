require "rails_helper"

RSpec.describe DoctorsController, :type => :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe '#show' do
    let(:doctor) { create(:doctor) }

    context 'record found' do
      it 'respond with 200' do
        get(doctor_path(id: doctor.id))
        expect(response).to have_http_status(200)
      end
    end

    context 'record not found' do
      it 'respond with 404' do
        get(doctor_path(id: 'invalid'))
        expect(response).to have_http_status(404)
      end
    end

    context 'unauthenticated access' do
        it 'redirected to sign_in' do
          sign_out user
          get(doctor_path(id: doctor.id))
          expect(response).to have_http_status(302)
          expect(response).to redirect_to(new_user_session_path)
        end
    end
  end

  describe '#index' do
    context 'doctor list not exists' do
      it 'render with no doctor found' do
        get(doctors_path)
        expect(response.body).to include('No doctors available')
        expect(response.body).not_to include('Check schedule')
      end
    end

    context 'doctor list exists' do
      it 'render with list of doctors' do
        create_list(:doctor, 3)
        get(doctors_path)
        expect(response.body).to include('Check schedule')
        expect(response.body).not_to include('No doctors available')
      end
    end
  end
end