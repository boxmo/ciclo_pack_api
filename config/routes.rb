Rails.application.routes.draw do
  # mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post "auth/login", to: "auth#login"
  post "auth/sign_up", to: "auth#signup"

  resources :orgs
  resources :products
  resources :reviews
end
