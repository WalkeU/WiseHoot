Rails.application.routes.draw do
  get "home/about"
  root "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  resources :tweets, only: [ :create, :destroy ] do
    resource :like, only: [ :create, :destroy ]
  end
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "logout", to: "sessions#destroy"
  get "register", to: "sessions#register"
  post "register", to: "sessions#create_user"

  # Settings routes
  get "settings", to: "settings#index"
  delete "settings/destroy_account", to: "settings#destroy_account", as: "destroy_account"
  # Defines the root path route ("/")
  # root "posts#index"
end
