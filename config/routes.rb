Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :jobs, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:new, :create]
  end

  namespace :provider do
    resources :jobs, only: [:index, :new, :create]
    resources :bookings, only: [:index,:update] #do :patch ???
    # equivalent to => get '/<namespace>/bookings', to: '<namespace>/bookings#index'
  end

  resources :bookings, only: [:index]
end
