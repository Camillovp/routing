Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # verb 'path', to: 'controller#action'

  # This will generate the 7 CRUD actions for you
  # resources :tasks

  # Alternatives when you don't need all of the 7 routes:
  # resources :tasks, only: [:index, :show]
  # resources :tasks, except: [:destroy]

  # See all tasks
  get '/tasks', to: 'tasks#index'

  # Create a restaurant - 2 routes
  # Get the form to fill in the restaurant info
  get '/tasks/new', to: 'tasks#new'
  # Receives the restaurant details and stores it in the DB
  post '/tasks', to: 'tasks#create'

  # See details about one restaurant
  get '/tasks/:id', to: 'tasks#show', as: :task

  # Update a restaurant - 2 routes
  # Get the form to change the restaurant info
  get '/tasks/:id/edit', to: 'tasks#edit', as: :edit
  # Receive the restaurant new details and update it in the DB
  patch '/tasks/:id', to: 'tasks#update'

  # Destroy a restaurant
  delete '/tasks/:id', to: 'tasks#destroy'
end
