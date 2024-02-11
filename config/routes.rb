Rails.application.routes.draw do

  resources :roles

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :member_roles
  resources :members do
    member do
      get 'delete_confirmation'
    end
  end

  root "events#index"

  resources :attendees do
    member do
      get 'delete'
    end
  end

  resources :events do
    member do
      get 'delete'
    end
  end

  resources :notifications
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

end
