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
<<<<<<< HEAD


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
=======
>>>>>>> 84eaa9b89299ea3a2051b900a397ec3487777cd5
  root 'home#index'
  resources :favorites

end
