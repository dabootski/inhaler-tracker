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

  has_many :events

  validates :name, :presence => true
  validates :mac_address, :presence => true
  validates :loop_timeout, :presence => true
  validates :notification_timeout, :presence => true

  store_accessor :settings, :loop_timeout, :notification_timeout

  def to_settings
    settings.keys.map do |k|
      "#{k}:#{settings[k]}"
    end.join(":")
  end

end
