class Users::RegistrationsController < Devise::RegistrationsController
  # Применяем `skip_before_action`, убрав лишние исключения
  skip_before_action :authenticate_user!, only: [:new, :create, :cancel]
end
