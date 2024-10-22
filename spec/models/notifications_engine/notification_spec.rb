require 'rails_helper'

RSpec.describe NotificationsEngine, type: :model do

  let(:notification) { NotificationsEngine::Notification.new(status: 'Sent', message: 'This is a test message.', user_id: 1, user_details: {title: "test email"}) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(notification).to be_valid
    end

    it 'is not valid without a status' do
      notification.status = nil
      expect(notification).not_to be_valid
    end

    it 'is not valid without a user_id' do
      notification.user_id = nil
      expect(notification).not_to be_valid
    end

    it 'is not valid without a user_details' do
      notification.user_details = nil
      expect(notification).not_to be_valid
    end

    it 'is not valid without a message' do
      notification.message = nil
      expect(notification).not_to be_valid
    end
  end
end
