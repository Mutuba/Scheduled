class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  include Devise::Controllers::Helpers

  before_action :set_time_zone, if: :user_signed_in?

  private

  def set_time_zone
    begin
      user_timezone = session[:user_timezone]
  
      if user_timezone.blank?
        result = Geocoder.search(request.ip).first
  
        if result&.data&.key?('timezone')
          user_timezone = result.data['timezone']
          session[:user_timezone] = user_timezone
        else
          sign_out(current_user)
          flash[:alert] = 'Unable to determine your timezone. Please log in again.'
          redirect_to new_user_session_path
          return
        end
      end
  
      if user_timezone.present?
        Time.zone = user_timezone || "UTC"
        current_user.update!(timezone: user_timezone)
      else
        sign_out(current_user)
        flash[:alert] = 'Invalid timezone information. Please log in again.'
        redirect_to new_user_session_path
      end
  
    rescue Geocoder::Error => e
      flash[:alert] = "Geocoder error: #{e.message}"
      redirect_to new_user_session_path
  
    rescue StandardError => e
      flash[:alert] = "Unexpected error: #{e.message}"
      redirect_to new_user_session_path
    end
  end
  
end
