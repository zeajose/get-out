Rails.application.routes.draw do
  devise_for :users do
    resources :bookings, only: [:index, :show]
  end

  root to: 'pages#home'
  resources :bookings, only: [:index]

  resources :posts do
    resources :photos, only: [:new, :create, :destroy]
    resources :bookings
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
