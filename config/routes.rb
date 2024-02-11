Rails.application.routes.draw do
  resources :members do
    member do
      get 'delete_confirmation'
    end
  end

  root "events#index"

  resources :events do
    resources :attendees do
      member do
        get 'delete'
      end
    end
    member do
      get 'delete'
    end
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

end
