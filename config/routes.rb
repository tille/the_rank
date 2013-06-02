TheRank::Application.routes.draw do
  get "logout" => "sessions#destroy", as: "log_out"
  get "login" => "sessions#new", as: "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  
  resources :users, only: [ :create ]
  resources :sessions, only: [ :create ]

  resources :characters
  resources :contests, only: [ :index, :show ]
  resources :battles, only: [ :index ]
  resources :votes, only: [ :create ]
  
  match '/welcome_email' => "mailer#welcome", via: "get"
  root :to => 'contests#index'
end