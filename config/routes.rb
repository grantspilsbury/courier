Courier::Application.routes.draw do
    root to: 'deliveries#new'

    match '/signin', to: 'sessions#new'
    match '/signout', to: 'sessions#destroy', via: :delete
    match '/signup', to: 'users#new'
    
    resources :deliveries
    resources :users
end
