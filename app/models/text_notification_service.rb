class TextNotificationService

  def send!(msg_options)
    $twilio.account.messages.create(
      :from => Rails.application.secrets.twilio_from_phone,
      :to => msg_options[:to],
      :body => msg_options[:body]
    )
  end

end
