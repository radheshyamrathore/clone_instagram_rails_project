Rails.application.routes.draw do
  root "posts#index"
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  #get '/signup' => 'sessions#new'
  resources :users do
    resources :posts 

  #get '/' => 'user#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
end