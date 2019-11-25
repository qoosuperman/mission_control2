Rails.application.routes.draw do
  resources :missions
  resources :users do
    get :mission, :on => :member
  end
  resources :sessions, only: [:new, :create, :destroy]
  root "missions#index"

  match '/admin',  to: 'users#index', via: :get, as: "admin"
  match '/signup',  to: 'users#new', via: :get
  match '/signin',  to: 'sessions#new', via: :get
  match '/signout', to: 'sessions#destroy', via: :delete

  %w( 404 422 500 503 ).each do |code|
    get code, :to => "errors#show", :code => code
  end
end
