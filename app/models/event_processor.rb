class EventProcessor

  def initialize(event)
    @event = event
  end

  def handle
    puts "***************************"
    puts "HANDLING EVENT: #{@event.inspect}"
    puts "***************************"

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
