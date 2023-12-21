# frozen_string_literal: true

# == Route Map
#

Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions'
  }

  root 'users#index'
  resources :events
  resources :bookings
  resources :users, only: %i[create update new index]

  get 'dashboard', to: 'dashboard#index'
end
