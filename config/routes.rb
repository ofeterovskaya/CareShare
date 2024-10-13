Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"

  resources :organizations

  # Маршруты для профиля пользователя
  get 'user_profile', to: 'users/users#profile', as: 'user_profile'
  get 'user_profile_form', to: 'users/users#profile_form', as: 'user_profile_form'
  patch 'user_profile_form', to: 'users/users#update_profile'
  patch 'upload_avatar', to: 'users/users#upload_avatar', as: 'upload_avatar_user'
  delete 'user_profile', to: 'users/users#destroy', as: 'delete_user_profile'
end