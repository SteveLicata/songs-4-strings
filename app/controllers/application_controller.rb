class ApplicationController < ActionController::Base
  protect_from_forgery prepend: :exception

  # paperlip
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar, :username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar, :username])
  end

  # devise
  def  after_sign_in_path_for(resource)
	   user_path(resource.id)
	end


end
