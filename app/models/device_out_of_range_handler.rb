class DeviceOutOfRangeHandler

  def initialize(event)
    @event = event
  end

  def handle
    @event.device.update!(
      :last_out_of_range => Time.now,
      :within_range => false
    )
  end

end
