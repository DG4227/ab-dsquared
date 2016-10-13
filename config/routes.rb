Rails.application.routes.draw do
  resource :credit_cards
  resource :bookings
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "bookings#new"

  # post '/bookings', to: 'bookings#new'
end
