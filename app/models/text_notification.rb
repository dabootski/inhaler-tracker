class TextNotification < Notification

  validates :name, :presence => true
  validates :phone, :presence => true
  validates :message, :presence => true
  validates :timeout, :presence => true

  store_accessor :settings,
    :phone, :message

  def display_name
    "Text"
  end

  def text_notification_service=(service)
    @text_notification_service = service
  end

  def text_notification_service
    @text_notification_service ||= TextNotificationService.new
  end

  def execute_notification
    text_notification_service.send!(
      :to => phone,
      :body => message
    )
  end

  # In seconds
  def throttle_timeout
    60 # Max of 1 text/minute
  end

end
