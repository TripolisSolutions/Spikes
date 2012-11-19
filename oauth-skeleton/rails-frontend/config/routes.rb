RailsFrontend::Application.routes.draw do
  resources :posts

  root to: "home#index"

  match '/auth/:provider/callback', to: 'sessions#create'
end
