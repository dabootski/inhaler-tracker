class Device < ActiveRecord::Base
  #
  # Fields:
  # - id          # :int
  # - mac_address # :string
  # - name        # :string
  # - settings    # :json
  # - account_id  # :int
  # - settings    # :json
  #

  belongs_to :account

  has_many :events,
    -> { order("created_at DESC") }

  has_many :notifications
  has_many :email_notifications,
    :source => "EmailNotification"
  has_many :text_notifications,
    :source => "TextNotification"

  validates :name, :presence => true
  validates :mac_address, :presence => true
  validates :loop_timeout, :presence => true
  validates :notification_timeout, :presence => true
  validates :settings_refresh_timeout, :presence => true
  validates :range_threshold, :presence => true

  before_save :set_last_out_of_range

  store_accessor :settings,
    :loop_timeout,
    :notification_timeout,
    :settings_refresh_timeout,
    :range_threshold

  def to_settings
    settings.keys.map do |k|
      "#{k}:#{settings[k]}"
    end.join(":")
  end

  private
  def set_last_out_of_range
    last_out_of_range = Time.now
  end

end
