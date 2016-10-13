Rails.application.routes.draw do
  resource :credit_cards
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  post '/bookings', to: 'home#new_booking'
end
