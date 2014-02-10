class DeviceWithinRangeHandler

  def initialize(event)
    @event = event
  end

  def handle
    puts "***************************"
    puts "SETTING WITHIN RANGE TO TRUE!"
    puts "***************************"

    @event.device.update!(
      :within_range => true
    )
  end

end
