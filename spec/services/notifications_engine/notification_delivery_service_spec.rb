require 'rails_helper'

RSpec.describe NotificationsEngine::NotificationDeliveryService, type: :service do
  let(:notification) { build(:notification, channel: channel) }

  let(:service) { described_class.new(notification) }

  describe '#send!' do
    before do
      allow(NotificationsEngine::NotificationMailer).to receive(:post_email)
      allow(TwilioClient).to receive(:messages)
    end

    context 'when the channel is email' do
      let(:channel) { 'email' }

      it 'sends an email' do
        mailer_double = double('Mailer', deliver_now: true)
        allow(NotificationsEngine::NotificationMailer).to receive(:post_email).with(notification).and_return(mailer_double)

        service.send!

        expect(NotificationsEngine::NotificationMailer).to have_received(:post_email).with(notification)
      end
    end

    context 'when the channel is sms' do
      let(:channel) { 'sms' }

      it 'sends an SMS' do
        twilio_client_double = double('TwilioClient')
        allow(TwilioClient).to receive(:messages).and_return(twilio_client_double)
        allow(twilio_client_double).to receive(:create)

        service.send!

        expect(twilio_client_double).to have_received(:create).with(
          from: ENV['TWILIO_PHONE_NUMBER'],
          to: '+911234567890',
          body: 'Test message'
        )
      end
    end

    context 'when the channel is all' do
      let(:channel) { 'all' }

      it 'sends both email and SMS' do
        mailer_double = double('Mailer', deliver_now: true)
        allow(NotificationsEngine::NotificationMailer).to receive(:post_email).with(notification).and_return(mailer_double)

        twilio_client_double = double('TwilioClient')
        allow(TwilioClient).to receive(:messages).and_return(twilio_client_double)
        allow(twilio_client_double).to receive(:create)

        service.send!

        expect(NotificationsEngine::NotificationMailer).to have_received(:post_email).with(notification)
        expect(twilio_client_double).to have_received(:create).with(
          from: ENV['TWILIO_PHONE_NUMBER'],
          to: '+911234567890',
          body: 'Test message'
        )
      end
    end

    context 'when the channel is unsupported' do
      let(:channel) { 'unsupported' }

      it 'raises an error' do
        expect { service.send! }.to raise_error('Unsupported channel')
      end
    end
  end
end
