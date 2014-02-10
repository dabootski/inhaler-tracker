require 'twilio-ruby'

$twilio = Twilio::REST::Client.new(
  Rails.application.secrets.twilio_account_sid,
  Rails.application.secrets.twilio_auth_token
)
