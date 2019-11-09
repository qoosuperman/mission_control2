Rails.application.routes.draw do
  resources :missions
  resources :users
  root "missions#index"
end
