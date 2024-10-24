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

    def show_in_app_notifications
      notification_logs
    end

    def read_all
      notification_logs
      @notification_logs.all.update_all(read: true)
      redirect_to in_app_notifications_path(user_id:  current_user.id)
    end

    def read_one
      notification_log = NotificationLog.find_by(id: params[:id])
      notification_log.update(read: true)
      redirect_to in_app_notifications_path(user_id:  current_user.id)
    end

    def notification_logs
      @notification_logs = NotificationLog.where(notification_type: ['in-app'], user_id: params[:user_id])
    end

    private

    def notification_params
      params.require(:notification).permit(:user_id, :message, :channel, :status, user_details: [:name, :email, :phone_number])
    end
  end
end
