class TextNotification < Notification

  validates :name, :presence => true
  validates :phone, :presence => true
  validates :timeout, :presence => true

  store_accessor :settings,
    :phone

  def display_name
    "Text"
  end

end
