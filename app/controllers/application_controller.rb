class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    flash[:notice] = 'Signed out successfully.'
    user_path(resource)
  end

  protected

  def configure_permitted_parameters
    flash[:alert] = 'Welcome! You have signed up successfully.'
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end
end
