Rails.application.routes.draw do

  devise_for :users

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :yachts do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:index, :show]
  get 'profile', to: 'pages#profile', as: :profile
end
