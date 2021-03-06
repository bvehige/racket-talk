Rails.application.routes.draw do
  
  root 'sessions#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/logout' => 'sessions#destroy'
  #delete '/logout' => 'sessions#destroy'

  get '/auth/google_oauth2/callback' => 'sessions#omniauth_google'
  get '/auth/github/callback' => 'sessions#omniauth_github'
  #get '/auth/:provider/callback' => 'sessions#create'
  delete 'comment/:id' => 'comment#destroy'

  get '/reviews/fivestars' => 'reviews#fivestars'

  resources :reviews do
    resources :comments
  end

  resources :rackets do 
    resources :reviews, only: [:new, :index]
  end
  resources :brands, only: [:index, :show] do 
    resources :rackets
  end
  resources :users
  resources :comments

  #If no route matches
  # Rails.application.routes.draw do
  #   # all your other routes
  #   match '*unmatched', to: 'application#route_not_found', via: :all
  # end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
