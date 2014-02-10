class TextNotificationsController < ApplicationController

  before_filter :fetch_device

  def new
    @account = @device.account
    @notification = @device.text_notifications.build
  end

  def create
    @notification = @device.text_notifications.build(notification_params)

    if @notification.save
      flash[:notice] = "Successfully saved"
      redirect_to edit_device_text_notification_path(@device, @notification)
    else
      render :new
    end
  end

  def edit
    @account = @device.account
    @notification = @device.text_notifications.find(params[:id])
  end

  def update
    @notification = @device.text_notifications.find(params[:id])

    if @notification.update(notification_params)
      flash[:notice] = "Successfully saved"
      redirect_to edit_device_text_notification_path(@device, @notification)
    else
      render :edit
    end
  end

  private

  def fetch_device
    @device = Device.find(params[:device_id])
  end

  def notification_params
    params.
      require(:text_notification).
      permit(
        :name,
        :active,
        :max_seconds_within_range,
        :message,
        :timeout,
        :phone
      )
  end

end

