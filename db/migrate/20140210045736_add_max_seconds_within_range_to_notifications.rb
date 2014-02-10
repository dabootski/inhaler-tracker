class AddMaxSecondsWithinRangeToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :max_seconds_within_range, :integer, :null => false
  end
end
