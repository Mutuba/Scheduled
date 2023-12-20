Rails.application.routes.draw do
  # resources :events
  # resources :bookings
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
  }

  root "home#index"
end
