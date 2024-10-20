class Users::SessionsController < Devise::SessionsController
  skip_before_action :authenticate_user!, only: [:new, :create, :destroy]

  def create
    user = User.find_by(email: params[:user][:email])

    if user.nil?
      flash[:alert] = I18n.t('errors.messages.invalid_login')
      redirect_to new_user_session_path
    elsif !user.valid_password?(params[:user][:password])
      flash[:alert] = I18n.t('errors.messages.invalid_login')
      redirect_to new_user_session_path
    else
      self.resource = warden.authenticate!(auth_options)
      set_flash_message!(:notice, :signed_in)
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with resource, location: after_sign_in_path_for(resource)
    end
  end

  protected

  def after_sign_in_path_for(resource)
    organizations_path
  end
end