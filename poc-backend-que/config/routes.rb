PocBackendQue::Application.routes.draw do

  root to: 'home_page#index'

  resources :sessions, only: [:create, :destroy]
  resources :places, only: [:create, :destroy]

  match '/auth/:provider/callback', to: 'sessions#create'
  match '/signout', to: 'sessions#destroy'

end
