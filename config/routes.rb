Rails.application.routes.draw do
  resources :trips
  resources :attractions
  resources :travelers

  root 'static_pages#index'
  get '/signup', to: 'travelers#new'
  get '/login', to: 'sessions#new'
  post "/sessions/create", to: "sessions#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
