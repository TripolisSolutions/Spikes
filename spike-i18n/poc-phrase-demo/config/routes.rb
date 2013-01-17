PocPhraseDemo::Application.routes.draw do
  root :to => "home#index"
  match '/:locale' => "home#index"

  scope "(:locale)", :locale => /en|de/ do
    resources :posts
  end
end
