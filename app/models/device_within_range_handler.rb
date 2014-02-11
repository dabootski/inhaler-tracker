class DeviceWithinRangeHandler

  def initialize(event)
    @event = event
  end

  def handle
    @event.device.update!(
      :within_range => true
    )
  end

end
