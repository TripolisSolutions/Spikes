PocMultitenant::Application.routes.draw do
  get "home/index"

  resources :posts

  resources :databases do
    post :select, on: :member
  end

  root :to => 'home#index'
end
