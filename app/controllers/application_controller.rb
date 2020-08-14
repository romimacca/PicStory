class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sing_up, keys:[:name])
  end

  def authenticate_admin!
    unless current_user.present? && current_user.is_admin?
      redirect_to root_path, alert: "Access Denied"
    end
  end
end
