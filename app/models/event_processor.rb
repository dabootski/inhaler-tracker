class EventProcessor

  def initialize(event)
    @event = event
  end

  #
  # TODO: Add an "event_code" field to Event model.
  #
  def handle
    puts "***************************"
    puts "HANDLING EVENT: #{@event.inspect}"
    puts "***************************"

    # Pass event off to handlers based on event name/title
    if @event.title == "Out of range"
      DeviceOutOfRangeHandler.new(@event).handle
    elsif @event.title == "In Range"
      DeviceWithinRangeHandler.new(@event).handle
    end
  end

end
