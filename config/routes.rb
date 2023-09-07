Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :vehicles, only: [:index]

      resources :users, only: [:index]

      patch 'vehicles/:id/update_state', to: 'vehicles#update_state', on: :member

      post 'vehicles/:id/set_acceptable_pattern', to: 'vehicles#set_acceptable_pattern', on: :member
    end
  end

end
