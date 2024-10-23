class AddReadColumnToNotification < ActiveRecord::Migration[7.1]
  def change
    add_column :notifications_engine_notifications, :read, :boolean
  end
end
