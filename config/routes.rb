Rails.application.routes.draw do
  
  resources :topics
  namespace :admin do
      resources :users
      resources :attendances
      resources :events
      resources :topics
      root to: "users#index"
    end

  
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :users, only: [:show, :new, :destroy] do
    resources :avatars, only: [:create]
  end

  post 'create_user' => 'users#create', as: :create_user

  resources :events
  resources :attendances, only: [:create, :destroy]
  resources :contact_form, only: %i[new show create]
  #Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  root to: "events#index"
  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end

  # authenticated :user do
  #   root to: "events#index"
  # end
  
  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end

end
