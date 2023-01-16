Rails.application.routes.draw do
   root "posts#index"
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  resources :users 
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :posts do
      resources :comments
  end
end
