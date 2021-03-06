Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :doctors, only: %i[index show]
  resources :appointments, only: %i[create]
  resources :schedules, only: %i[show]

  root 'doctors#index'
end
