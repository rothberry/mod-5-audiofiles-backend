Rails.application.routes.draw do
  resources :comments
  resources :favorites, only: [:create, :show, :destroy]
  resources :song_tags
  resources :tags
  resources :songs
  resources :users
  namespace :api do
    namespace :v1 do
      post '/auth', to: "auth#create"
      get '/current_user', to: 'auth#show'
    end
  end
  resources :followings, only: [:index, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
