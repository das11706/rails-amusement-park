Rails.application.routes.draw do
  root to: 'static#home'
  # resources :users
  get '/users/new', to: 'users#new'
  get '/users/', to: 'users#index'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'
  # get '/signin', to: 'sessions#new', as: 'signin'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/attractions' => 'attractions#index'
  get '/attractions/new' => 'attractions#new', as: 'new_attraction'
  get '/attractions/:id' => 'attractions#show', as: 'attraction'
  post '/attractions' => 'attractions#create'
  get '/attractions/:id/edit' => 'attractions#edit'
  patch '/attractions/:id' => 'attractions#update'
  post '/rides' => 'rides#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# resources :users

end
