require 'reloader/sse'

module Api
  module Streaming
    class EventsController < ApplicationController
      include ActionController::Live

      def index
        # SSE expects the `text/event-stream` content type
        response.headers['Content-Type'] = 'text/event-stream'

        sse = Reloader::SSE.new(response.stream)

        begin
          loop do
            evs = Event.where("device_id = ? and created_at < ?", params[:device_id], Time.now).reload
            sse.write({:events => evs.to_json, :time => Time.now}, :event => 'refresh')
            sleep 1

            respond_to do |format|
              format.json do
              end
            end
          end
        rescue IOError
          # When the client disconnects, we'll get an IOError on write
        ensure
          sse.close
        end
      end

    end
  end
end
