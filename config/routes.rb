Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  root "products#index"

  # Products routing
  # get "/products", to: "products#index"
  # NOTE: When we see a matching GET request to "/products", it will send the request to the
  #       ProductsController, and the index action within that controller. This is how the
  #       request is processed and a response is generated.

  # This creates all of the standard CRUD routes for a particular model
  resources :products do
    resources :subscribers, only: [ :create ]
  end
end
