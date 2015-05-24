Rails.application.routes.draw do

  resources :teams

  resources :bets, only: [:index]

  resources :teams, except: [:show]

  resources :matches do
    member do
      get :provide_results
    end
    collection do
      get :history
    end
    resources :bets
  end

  resources :users

  resources :bets, only: [:index]

  devise_for :users, path: "auth",
  path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret',
    confirmation: 'verification', unlock: 'unblock', registration: 'register',
     sign_up: 'cmon_let_me_in' }

  devise_for :admins, path_names: { sign_in: 'login', sign_out: 'logout' }

  root to: 'users#home'
end
