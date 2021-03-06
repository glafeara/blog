Rails.application.routes.draw do

  resources :users  do
  member do
    get 'activeadmin'
    get 'checked'
    end
  end

  resources :categories

  resources :articles do
    resources :comments
  end

  resources :sessions, only: [ :new, :create, :destroy ]

  root  'static_pages#index'
  match '/dashboard', to: 'dashboard#index',   via: 'get'
  match '/signin',    to: 'sessions#new',      via: 'get'
  match '/signup',    to: 'users#new',         via: 'get'
  match '/signout',   to: 'sessions#destroy',  via: 'get'

end
