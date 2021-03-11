Rails.application.routes.draw do
  root to: 'users#show', as: 'earwig'

  resources :reviews do
    resources :likes
  end
  resources :podcasts do 
  resources :favorites
  end
  resources :moods
  resources :users


  put '/review/:id/like', to: 'reviews#like', as: 'like'

  get '/login', to: 'users#login', as: 'login'
  post '/handle_login', to: 'users#handle_login'
  delete '/logout', to: 'users#logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
