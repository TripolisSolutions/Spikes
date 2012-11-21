TwitterInfoPoc::Application.routes.draw do
  resources :user_followers

  root to: "home#index"

  match "auth/twitter/callback" => "sessions#create"
  delete "session" => "sessions#destroy", as: "delete_session"
end
