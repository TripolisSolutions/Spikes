PocAudit::Application.routes.draw do
  resources :facebook_posts do
    get 'audit', on: :member
  end

  root to: "home#index"

  match "auth/twitter/callback" => "sessions#create"
  delete "session" => "sessions#destroy", as: "delete_session"
end
