Rails.application.routes.draw do
  

  root 'pages#home'

  get "pages/home"
  get "/signup", to: "users#new", as: :signup
  post "/users", to: "users#create"
  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :categories
  resources :todos do
    collection do
      get 'completed'
    end
  end

  resources :sessions, only: [:new, :create, :destroy]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users
  

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
