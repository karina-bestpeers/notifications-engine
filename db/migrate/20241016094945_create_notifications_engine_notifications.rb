class CreateNotificationsEngineNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :notifications_engine_notifications do |t|
      t.integer :user_id
      t.text :message
      t.string :status
      t.string :channel

      t.timestamps
    end
  end
end
