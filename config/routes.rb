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
  resources :users, only: [:create, :update, :new]
  get 'new_office_hours', to: 'home#new_office_hours'
  get 'dashboard', to: 'dashboard#index'
end
