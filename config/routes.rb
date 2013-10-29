Courier::Application.routes.draw do
    root to: 'deliveries#new'

    match '/signin', to: 'sessions#new'
    match '/signout', to: 'sessions#destroy', via: :delete
    match '/signup', to: 'users#new'
    
    resources :sessions, only: [:new, :create, :destroy]
    
    resources :deliveries, only: [:new, :create]
    resources :users do
        resources :deliveries, only: [:index]
    end
end
