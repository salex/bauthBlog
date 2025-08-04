Rails.application.routes.draw do
  namespace :blog do
    namespace :about do
      get 'index'
      get 'background'
      get 'family'
      get 'golf'
      get 'geekdome'
      get 'me'
      get 'wanda'
    end
    namespace :articles do
      resources :viewer, only: [:index, :show] 
    end

  end

  # semi private links
  get 'wanda', to: 'pages#wanda'
  get 'laura', to: 'pages#laura'
  get 'tom', to: 'pages#tomconcept'
  get "/pages/*page" => "pages#show"
  get "pages" => "pages#show"

  resources :articles
  resource :session
  resources :passwords, param: :token
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  get "login", to: "sessions#new" 

  get "dashboard", to: "dashboard#show"
  get "db", to: "dashboard#show"

  get "blog", to: "blog#index"

  get "home", to: "blog#index"
  root "blog#index"
  get "*path", to: "blog#index"

end
