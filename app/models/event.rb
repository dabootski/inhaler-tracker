class Event < ActiveRecord::Base
  #
  # Fields:
  # - id          # :int
  # - title       # :string
  # - description # :string
  # - device_id   # :int
  #

  belongs_to :device

end
