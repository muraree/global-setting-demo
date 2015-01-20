class SettingsController < ApplicationController

  before_filter :authenticate_user!
  
  # should redirect to edit setting if global setting already exist.
  def new
    unless current_user.setting.present?
      @setting = Setting.new
    else
      redirect_to edit_setting_path(current_user.setting)
    end
  end

  # should redirect to new setting if current user does not have global setting. 
  def edit
    @setting = current_user.setting
    redirect_to new_setting_path unless @setting.present?
  end

  def create
    @setting = current_user.build_setting(setting_param)
    if @setting.save
      redirect_to edit_setting_path(@setting), notice: 'Setting saved successfully.'
    else
      render action: :new
    end
  end

  def update
    @setting = current_user.setting
    if @setting.update(setting_param)
      redirect_to edit_setting_path(@setting), notice: 'Setting updated successfully.'
    else
      render action: :edit
    end
  end
 
  private
 
  def setting_param
    params.require(:setting).permit( :email, :enable_notification )
  end

end
