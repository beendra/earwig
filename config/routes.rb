Rails.application.routes.draw do
  resources :likes
  resources :favorites
  resources :reviews
  resources :podcasts
  resources :moods
  resources :users

  put '/review/:id/like', to: 'reviews#like', as: 'like'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
