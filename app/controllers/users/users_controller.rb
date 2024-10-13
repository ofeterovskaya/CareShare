class Users::UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
    @user = current_user
    @applications = @user.role == 'volunteer' ? @user.volunteer_needs : @user.volunteer_need_assignments
    render 'users/profile'  # Явно указываем путь к представлению
  end

  def profile_form
    @user = current_user
    @help_options = [
      'Hygiene products',
      'Kitchenware',
      'Clothes',
      'Shoes',
      'Books',
      'Time',
      'Emotional support',
      'Carpool'
    ]
    render 'users/profile_form'  # Явно указываем путь к представлению
  end

  def update_profile
    @user = current_user
    if @user.update(user_params)
      redirect_to user_profile_path, notice: 'Profile updated successfully.'
    else
      @help_options = [
        'Hygiene products',
        'Kitchenware',
        'Clothes',
        'Shoes',
        'Books',
        'Time',
        'Emotional support',
        'Carpool'
      ]
      render 'users/profile_form'
    end
  end

  def upload_avatar
    @user = current_user
    Rails.logger.debug "Avatar params: #{params.inspect}"
    @user.avatar.attach(avatar_params[:avatar])
    if @user.save(validate: false)
      Rails.logger.debug "Avatar uploaded successfully"
      redirect_to user_profile_path, notice: 'Avatar uploaded successfully.'
    else
      Rails.logger.debug "Failed to upload avatar: #{@user.errors.full_messages.join(", ")}"
      redirect_to user_profile_path, alert: 'Failed to upload avatar.'
    end
  end

  def destroy
    @user = current_user
    @user.destroy
    redirect_to root_path, notice: 'Your profile has been successfully deleted.'
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation, :about, :help_option)
  end

  def avatar_params
    params.require(:user).permit(:avatar)
  end
end