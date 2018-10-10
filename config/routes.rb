Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :users
resources :films
resources :drinks

resources :books do
  resources :reviews
  resources :ratings
end

root 'users#index'

get '/auth/facebook/callback' => 'sessions#create'
end
