class AddUserDetailsToNotifications < ActiveRecord::Migration[7.1]
  def change
    add_column :notifications_engine_notifications, :user_details, :json
  end
end
