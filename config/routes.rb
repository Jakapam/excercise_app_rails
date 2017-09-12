Rails.application.routes.draw do

  root "users#welcome"

  resources :users do
    resources :challenges
  end


  resources :routines do
    resources :routine_exercises, only: [:new, :create]
  end

  resources :routine_exercises, except: [:new, :create]

  resources :exercises

  get "/signin" => "sessions#new"
  post "/signin" => "sessions#create"
  delete "/signout" => "sessions#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
