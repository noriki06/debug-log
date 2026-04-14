Rails.application.routes.draw do
  get "/login", to: "sessions#new", as: :login
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: :logout

  get "/signup", to: "users#new", as: :signup
  post "/signup", to: "users#create"


  resources :articles
  devise_for :users
  resources :categories
  get "home/index"
  root "home#index"
  
  get "up" => "rails/health#show", as: :rails_health_check

  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  get "/posts", to: "posts#index", as: :posts
  get "/posts/new", to: "posts#new", as: :new_post
  post "/posts", to: "posts#create"
  get "posts/:id", to: "posts#show", as: :post
  get "posts/:id/edit", to: "posts#edit", as: :edit_post
  patch "posts/:id", to: "posts#update", as: :update_post
  delete "posts/:id", to: "posts#destroy", as: :destroy_post

  get "users/:id", to: "users#show", as: :user
end
