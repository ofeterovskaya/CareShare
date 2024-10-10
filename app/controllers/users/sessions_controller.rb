class Users::SessionsController < Devise::SessionsController
  skip_before_action :authenticate_user!, only: [:new, :create, :destroy]

  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  rescue
    if params[:user][:email].blank?
      flash[:alert] = I18n.t('errors.messages.email_blank')
    elsif !params[:user][:email].match?(/\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/)
      flash[:alert] = I18n.t('errors.messages.email_invalid')
    elsif params[:user][:password].blank?
      flash[:alert] = I18n.t('errors.messages.password_blank')
    else
      flash[:alert] = I18n.t('errors.messages.invalid_login')
    end
    redirect_to new_user_session_path
  end
end