class TestSettingsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :can_send_message

  # This action is used to chek the global setting. if notification is enabled and the email is is given,
  # Then the email should be sent.
  def send_email
    unless params[:message].blank?
      Notifier.test_message(current_user.setting.try(:email), params[:message]).deliver
      flash[:notice] = "Message sent successfully."   
    else
      flash[:notice] = "Please insert the message"
    end
    redirect_to new_email_test_settings_path
  end

  def new_email
  end

  private

  # This filter redirect to global setting page, if setting is not proper.
  def can_send_message
    unless current_user.can_send_notification?
      redirect_to new_setting_path, :notice => "you need to set email and enable notification to test global setting."
    end
  end
end
