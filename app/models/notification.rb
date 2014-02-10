class Notification < ActiveRecord::Base

  belongs_to :device

  has_many :sent_notifications,
    -> { order("created_at DESC") }

  validates :max_seconds_within_range, :presence => true

  def notify
    execute_notification
    update_attributes!(:last_notified_at => Time.now)
  end

end
