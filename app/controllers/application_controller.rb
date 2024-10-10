class ApplicationController < ActionController::Base
  # Уберите `except: [:index]`
  before_action :authenticate_user!

  # Используйте `skip_before_action` для контроллеров Devise
  skip_before_action :authenticate_user!, if: :devise_controller?

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :role, :email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :role, :email, :password, :password_confirmation, :current_password])
  end

  def after_sign_in_path_for(resource)
    organizations_path
  end
end
