class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :authenticate_user!, only: [:new, :create, :cancel]

  protected

  def after_sign_up_path_for(resource)
    organizations_path
  end

  def after_update_path_for(resource)
    root_path
  end
end