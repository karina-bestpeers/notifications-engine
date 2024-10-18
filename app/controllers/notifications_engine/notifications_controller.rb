module NotificationsEngine
  class NotificationsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create]

    def index
      render json: { message: "NotificationEngine routes are working!" }, status: :ok
    end

    def create
      notification = Notification.new(notification_params)
      if notification.save
        NotificationDeliveryService.new(notification).send!
        render json: { message: 'Notification created and sent.' }, status: :created
      else
        render json: { errors: notification.errors }, status: :unprocessable_entity
      end
    end

    private

    def notification_params
      params.require(:notification).permit(:user_id, :message, :channel, :status, user_details: [:name, :email, :phone_number])
    end
  end
end
