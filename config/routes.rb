Rails.application.routes.draw do
  resources :posts

  resources :users 
    devise_for :users, path: "user", path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'sign_up' }

  root to: "posts#index"  
end
