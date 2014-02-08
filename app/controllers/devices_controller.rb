class DevicesController < ApplicationController

  def show
    @device = Device.find(params[:id])
    @events = @device.events.order("created_at DESC")
  end

  def update
    @device = Device.find(params[:id])

    if @device.update(device_params)
      flash[:notice] = "Successfully saved"
      redirect_to device_path(@device)
    else
      render :show
    end
  end

  private

  def device_params
    params.
      require(:device).
      permit(
        :name,
        :loop_timeout,
        :notification_timeout,
        :settings_refresh_timeout,
        :range_threshold
      )
  end

end
