Rails.application.routes.draw do
  
  root "users#welcome"

  resources :users
  resources :routine_exercises
  resources :routines
  resources :exercises

  get "/signin" => "sessions#new"
  post "/signin" => "sessions#create"
  delete "/signout" => "sessions#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
