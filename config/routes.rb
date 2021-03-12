Rails.application.routes.draw do
  root to: 'users#show', as: 'earwig'

  resources :reviews do
    resources :likes
  end
  resources :podcasts  
  resources :favorites, except: [:destroy]
  resources :moods
  resources :users

  get '/random_podcast', to: 'podcasts#random', as: 'random_pod'

  put '/review/:id/like', to: 'reviews#like', as: 'like'
  
  # post '/new_favorite', to: 'favorites#new_favorite', as: 'new_favorite'
  delete '/favorites/:id', to: 'favorites#destroy', as: 'destroy'

  get '/login', to: 'users#login', as: 'login'
  post '/handle_login', to: 'users#handle_login'
  delete '/logout', to: 'users#logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
