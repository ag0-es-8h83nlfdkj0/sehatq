require 'rails_helper'

RSpec.describe User, :type => :model do
  context 'valid attributes' do
    it 'valid' do
      expect(build(:user)).to be_valid
    end
  end

  context 'missing name' do
    it 'invalid' do
      expect(build(:user, name: nil)).not_to be_valid
    end
  end

  context 'missing email' do
    it 'invalid' do
      expect(build(:user, email: nil)).not_to be_valid
    end
  end

  context 'invalid email' do
    it 'invalid' do
      expect(build(:user, email: 'invalid at gmail dot com')).not_to be_valid
    end
  end

  context 'email exists' do
    it 'invalid' do
      created = create(:user)
      expect(build(:user, email: created.email)).not_to be_valid
    end
  end
end