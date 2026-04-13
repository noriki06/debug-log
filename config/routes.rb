Rails.application.routes.draw do
  resources :articles
  devise_for :users
  resources :categories
  get "home/index"
  root "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
  get "/posts", to: "posts#index", as: :posts
  get "/posts/new", to: "posts#new", as: :new_post
  post "/posts", to: "posts#create"
  get "posts/:id", to: "posts#show", as: :post
  get "posts/:id/edit", to: "posts#edit", as: :edit_post
  patch "posts/:id", to: "posts#update", as: :update_post
  delete "posts/:id", to: "posts#destroy", as: :destroy_post

  get "users/:id", to: "users#show", as: :user
end
