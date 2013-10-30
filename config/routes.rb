Courier::Application.routes.draw do
    root to: 'deliveries#new'

    post "chargify/endpoints"

    match '/signin', to: 'sessions#new'
    match '/signout', to: 'sessions#destroy', via: :delete
    match '/signup', to: 'users#new'

    match '/terms', to: 'static_pages#terms'
    match '/benefits', to: 'static_pages#benefits'
    match '/how', to: 'static_pages#how_it_works'
        
    resources :sessions, only: [:new, :create, :destroy]
    
    resources :deliveries, only: [:new, :create]
    resources :users do
        resources :deliveries, only: [:index]
    end

    resources :password_resets
  
end
