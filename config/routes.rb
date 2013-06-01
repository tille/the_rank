TheRank::Application.routes.draw do
  get "log_out" => "sessions#destroy", as: "log_out"
  get "log_in" => "sessions#new", as: "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  
  resources :users, only: [ :new, :create ]
  resources :sessions, only: [ :new, :create ]

  resources :characters
  resources :contests, only: [ :index, :show ]
  resources :battles, only: [ :index ]
  resources :votes, only: [ :create ]
  
  match '/welcome_email' => "mailer#welcome", via: "get"
  root :to => 'contests#index'
end