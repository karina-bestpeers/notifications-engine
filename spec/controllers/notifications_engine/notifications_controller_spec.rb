require 'rails_helper'

RSpec.describe NotificationsEngine::NotificationsController, type: :controller do
  render_views
  routes { NotificationsEngine::Engine.routes }

  let(:valid_attributes) {attributes_for(:notification)}

  let(:invalid_attributes) do
    {
      user_id: nil,
      message: "",
      channel: "invalid_channel",
      status: "pending"
    }
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
      expect(JSON.parse(response.body)).to include("message" => "NotificationEngine routes are working!")
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Notification and sends it' do
        allow_any_instance_of(NotificationsEngine::NotificationDeliveryService).to receive(:send!).and_return(true)

        expect do
          post :create, params: { notification: valid_attributes }
        end.to change(NotificationsEngine::Notification, :count).by(1)

        expect(response).to have_http_status(:created)
        expect(response.body).to include('Notification created and sent.')
      end
    end

    context 'with invalid params' do
      it 'returns unprocessable entity status' do
        post :create, params: { notification: invalid_attributes }
        expect(response).to have_http_status(422)

        expect(JSON.parse(response.body)['errors']).to be_present
      end
    end
  end

  describe 'GET #show_in_app_notifications' do
    let!(:notification) { create(:notification, channel: 'in-app', status: 'sent') }

    it 'returns notifications for in-app channel' do
      get :show_in_app_notifications, params: { user_id: notification.user_id }
      expect(assigns(:notifications)).to include(notification)
    end
  end
end
