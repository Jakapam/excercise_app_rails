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


  get "/users/:user_id/challenges/:id/accept" => "challenges#accept", as: 'accept_challenge'
  get "/users/:user_id/challenges/:id/reject" => "challenges#reject", as: 'reject_challenge'
  get "/users/:user_id/challenges/:id/complete" => "challenges#complete", as: 'complete_challenge'

  get "/signin" => "sessions#new"
  post "/signin" => "sessions#create"
  delete "/signout" => "sessions#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
