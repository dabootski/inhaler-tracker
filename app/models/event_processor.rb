class EventProcessor

  def intitialized(event)
    @event = event
  end

  def handle
    # Pass event off to handlers based on event name/title
    if @event.title == "Out of range"
      DeviceOutOfRangeHandler.new.handle(@event)
    elsif @event.title == "In range"
      DeviceWithinRangeHandler.new.handle(@event)
    end
  end

end
