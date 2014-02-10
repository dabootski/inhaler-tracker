class AddLastNotifiedToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :last_notified, :datetime, :null => true
  end
end
