class RemoveUserIdAndReadFromNotifications < ActiveRecord::Migration[7.1]
  def change
    remove_column :notifications_engine_notifications, :user_id, :integer
    remove_column :notifications_engine_notifications, :read, :boolean
  end
end