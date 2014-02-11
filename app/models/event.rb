class Event < ActiveRecord::Base
  #
  # Fields:
  # - id          # :int
  # - title       # :string
  # - description # :string
  # - device_id   # :int
  #

  belongs_to :device

  scope :settings_sync, -> { where("title = 'Settings synced'") }

  scope :important, -> { where("title != 'Settings synced'") }

end
