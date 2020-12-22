Rails.application.routes.draw do
  resources :comments
  root 'sessions#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/logout' => 'sessions#destroy'
  #delete '/logout' => 'sessions#destroy'
  

  resources :reviews do
    resources :comments
  end

  resources :rackets do 
    resources :reviews, only: [:new, :index]
  end
  resources :brands do
    resources :rackets
  end
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
