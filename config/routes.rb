Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/new'
  get 'posts/create'
  get 'posts/update'
  get 'posts/destroy'
  get 'posts/show'
  get 'posts/edit'
  devise_for :users

  root to: 'pages#home'
  resources :bookings, except: [:new, :create]

  resources :posts do
    resources :photos, only: [:new, :create, :destroy]
    resources :bookings, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
