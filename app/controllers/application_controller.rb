class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

	#permit parameters for sign up
	def configure_permitted_parameters
	  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmartion) }
	end

	def after_sign_in_path_for(resource_or_scope)
    home_index_path
	end

	def after_sign_out_path_for(resource_or_scope)
	  new_user_session_path
	end
end
