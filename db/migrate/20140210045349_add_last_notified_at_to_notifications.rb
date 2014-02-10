class AddLastNotifiedAtToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :last_notified_at, :datetime, :null => true
  end
end
