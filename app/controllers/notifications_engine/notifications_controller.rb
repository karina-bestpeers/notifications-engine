module NotificationsEngine
  class NotificationsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create]

    def index
      render json: { message: "NotificationEngine routes are working!" }, status: :ok
    end

    def create
      notification = Notification.new(notification_params)
      notification.read = false
      if notification.save
        NotificationDeliveryService.new(notification).send!
        render json: { message: 'Notification created and sent.' }, status: :created
      else
        render json: { errors: notification.errors }, status: :unprocessable_entity
      end
    end

    def show_in_app_notifications
      @notifications = Notification.where(channel: ['in-app', 'all'])
    end

    def read_all
      Notification.all.update_all(read: true)
      redirect_to in_app_notifications_path
    end

    def read_one
      notification = Notification.find_by(id: params[:id])
      notification.update(read: true)
      redirect_to in_app_notifications_path
    end

    private

    def notification_params
      params.require(:notification).permit(:user_id, :message, :channel, :status, user_details: [:name, :email, :phone_number])
    end
  end
end
