Rails.application.routes.draw do
  resources :missions
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  root "missions#index"

  match '/signup',  to: 'users#new', via: :get
  match '/signin',  to: 'sessions#new', via: :get
  match '/signout', to: 'sessions#destroy', via: :delete
end
