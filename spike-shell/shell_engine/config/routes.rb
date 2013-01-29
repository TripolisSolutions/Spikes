Rails.application.routes.draw do

  namespace :dashboard do
    resources :ideas, only: [:index, :show, :destroy]
    resources :users, only: [:show, :update]
    match '/profile',  to: 'users#profile'
  end

  root to: "dashboard#index"
  resources :sessions, only: [:new, :create, :destroy]
  match '/signin',  to: 'sessions#create'
  match '/signout', to: 'sessions#destroy', via: :delete

  resources :themes, only: [:create]



end
