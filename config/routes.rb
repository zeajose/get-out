Rails.application.routes.draw do
  get 'bookings/index'
  get 'bookings/new'
  get 'bookings/create'
  get 'bookings/edit'
  get 'bookings/update'
  devise_for :users

  root to: 'pages#home'
  resources :bookings, except: [:new, :create, :destroy]

  resources :posts do
    resources :photos, only: [:new, :create, :destroy]
    resources :bookings, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
