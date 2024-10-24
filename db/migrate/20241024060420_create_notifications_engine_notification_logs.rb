class CreateNotificationsEngineNotificationLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :notifications_engine_notification_logs do |t|
      t.references :notifications_engine_notifications, null: false, foreign_key: true
      t.integer :user_id
      t.string :status
      t.string :type

      t.timestamps
    end
  end
end
