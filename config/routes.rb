Rails.application.routes.draw do
  get 'jobs/index'
  get 'jobs/show'
  get 'jobs/new'
  get 'jobs/create'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :jobs, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:create, :new]
  end
end
