Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get "up" => "rails/health#show", as: :rails_health_check

  root "home#index"

  resources :organizations

  get 'user_profile', to: 'users/users#profile', as: 'user_profile'
  get 'user_profile_form', to: 'users/users#profile_form', as: 'user_profile_form'
  patch 'user_profile_form', to: 'users/users#update_profile'
  patch 'upload_avatar', to: 'users/users#upload_avatar', as: 'upload_avatar_user'
  delete 'user_profile', to: 'users/users#destroy', as: 'delete_user_profile' # Удаление профиля

  
  resources :organization_need_assignments, only: [:new, :create, :edit, :update, :destroy]
end