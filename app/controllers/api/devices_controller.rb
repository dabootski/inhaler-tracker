module Api
  class DevicesController < ApplicationController

    #def show
      #@device = Device.find(params[:id])

      #respond_to do |format|
        #format.json do
          #render :json => @device
        #end
      #end
    #end

    def settings
      @device = Device.find(params[:id])

      render :text => @device.to_settings
    end

    # TODO: Replace this!!!
    def create_event
      @device = Device.find(params[:id])

      @device.events.create!(
        :title => params[:title],
        :description => params[:description]
      )

      render :nothing => true, :status => 200
    end

  end
end
