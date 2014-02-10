class EventsController < ApplicationController

  def index
    @device = Device.find(params[:device_id])
  end

  def create
    device = Device.find(params[:device_id])
    @event = device.events.build(event_params)

    respond_to do |format|
      format.json do
        if @event.save
          logger.fatal "***************************"
          logger.fatal "HANDING OFF TO EVENT PROCESSOR: #{@event.inspect}"
          logger.fatal "***************************"

          EventProcessor.new(@event).handle
          render :json => @event, :status => :created
        else
          render :json => @event.errors, :status => :unprocessable_entity
        end
      end
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description)
  end

end
