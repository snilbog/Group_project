Rails.application.routes.draw do

  get "/favorites" => "favorites#index"


  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get '/logout' => 'sessions#destroy'

  get "/signup" => "users#new"
  post "/users" => "users#create"

  # get "favorites/:id/comments" => "comments#show", as: 'comments'

  get "comments/new/:id" => "comments#new", as: "new_comment"
  
  post "/comments" => "comments#create"

  get "/drinks/index" => "drinks#index"
  get "/drinks/adv" => "drinks#adv_search"
  post "/drinks/adv_result" => "drinks#adv_result"
  post "/drinks/result" => "drinks#result"


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'
  resources :favorites
  # resources :comments

  # resources :drinks, except: [:edit, :update]


  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
