class EventProcessor

  def initialize(event)
    @event = event
  end

  def handle
    logger.fatal "***************************"
    logger.fatal "HANDLING EVENT: #{@event.inspect}"
    logger.fatal "***************************"

    # Pass event off to handlers based on event name/title
    if @event.title == "Out of range"
      logger.fatal "***************************"
      logger.fatal "OUT OF RANGE HANDLER CALLED"
      logger.fatal "***************************"

      DeviceOutOfRangeHandler.new.handle(@event)
    elsif @event.title == "In range"
      logger.fatal "***************************"
      logger.fatal "WITHIN RANGE HANDLER CALLED"
      logger.fatal "***************************"

      DeviceWithinRangeHandler.new.handle(@event)
    end
  end

end
