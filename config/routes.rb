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
  get '/auth/:provider/callback', to: 'sessions#create'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
