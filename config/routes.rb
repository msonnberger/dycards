Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'stacks#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  # resources :users, only: [:show, :edit, :update, :destroy]

  resources :stacks
  resources :flashcards
  get '/flashcards/:id/next', to: 'flashcards#next'
end
