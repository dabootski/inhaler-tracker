class EventProcessor

  def intitialized(event)
    @event = event
  end

  def handle
    # Pass event off to handlers based on event name/title
    if @event.title == "Out of range"
      puts "***************************"
      puts "OUT OF RANGE HANDLER CALLED"
      puts "***************************"

      DeviceOutOfRangeHandler.new.handle(@event)
    elsif @event.title == "In range"
      puts "***************************"
      puts "WITHIN RANGE HANDLER CALLED"
      puts "***************************"

      DeviceWithinRangeHandler.new.handle(@event)
    end
  end

end
