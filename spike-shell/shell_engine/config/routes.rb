Rails.application.routes.draw do
  root to: "dashboard#index"
  resources :sessions, only: [:new, :create, :destroy]
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
end
