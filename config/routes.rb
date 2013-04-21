TheRank::Application.routes.draw do
  resources :characters
  resources :contests, only: [ :index, :show ]
  
  root :to => 'contests#index'
end