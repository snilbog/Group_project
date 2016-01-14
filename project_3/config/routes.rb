Rails.application.routes.draw do

  get "/favorites" => "favorites#index"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get '/logout' => 'sessions#destroy'

  get "/signup" => "users#new"
  post "/users" => "users#create"

  get "comments/new/:id" => "comments#new", as: "new_comment"
  
  post "/comments" => "comments#create"

  get "/drinks/index" => "drinks#index"
  get "/drinks/adv" => "drinks#adv_search"
  post "/drinks/adv_result" => "drinks#adv_result"
  post "/drinks/result" => "drinks#result"

  root 'home#index'
  resources :favorites

end
