Courier::Application.routes.draw do
    root to: 'static_pages#home'

    match '/signin', to: 'sessions#new'
    match '/signout', to: 'sessions#destroy', via: :delete
    match '/signup', to: 'users#new'
    
    resources :deliveries
    resources :users
end
