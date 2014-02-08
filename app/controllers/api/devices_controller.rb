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

  end
end
