Rails.application.routes.draw do
  root to: 'stacks#index'
  get 'stats/index'
  get '/imprint', to: 'application#imprint'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :users, only: [:show, :edit, :update, :destroy]
  get '/statistics', to: 'stats#index'

  resources :stacks do
    resources :flashcards
  end

  get '/flashcards/:id/next', to: 'flashcards#next', as: :next_card
end
