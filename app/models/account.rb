class Account < ActiveRecord::Base
  #
  # Fields:
  # - id       # :int
  # - username # :string
  # - email    # :string
  # - phone    # :string
  #

  has_many :devices

  def full_name
    "Jason Bucki"
  end

end
