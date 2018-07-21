Rails.application.routes.draw do
  resources :attractions
  resources :travelers do
    resources :trips
  end

  root 'static_pages#index'
  get '/signup', to: 'travelers#new'
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#delete'
  post "/sessions/create", to: "sessions#create"
  get 'travelers/:id/trips', to: 'travelers#trip_index'
  get 'travelers/:id/:trips/:trip_id', to: 'travelers#trip'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
