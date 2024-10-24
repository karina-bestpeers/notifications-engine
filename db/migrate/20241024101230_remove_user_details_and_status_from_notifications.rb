class RemoveUserDetailsAndStatusFromNotifications < ActiveRecord::Migration[7.1]
  def change
    remove_column :notifications_engine_notifications, :user_details, :json
    remove_column :notifications_engine_notifications, :status, :string
  end
end
