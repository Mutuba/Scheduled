# == Route Map
#

Rails.application.routes.draw do

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
  }

  root "home#index"
  resources :events
  resources :bookings
  post 'office_hours', to: 'home#office_hours', as: :office_hours
  patch 'office_hours', to: 'home#office_hours'
  get 'dashboard', to: 'dashboard#index'
end
