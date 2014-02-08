class EmailNotification < Notification

  validates :name, :presence => true
  validates :email, :presence => true
  validates :timeout, :presence => true

  store_accessor :settings,
    :email

  def display_name
    "Email"
  end

end
