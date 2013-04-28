TheRank::Application.routes.draw do
  resources :characters
  resources :contests, only: [ :index, :show ]
  
  match '/welcome_email' => "mailer#welcome", via: "get"
  root :to => 'contests#index'
end