Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'welcome#home'

resources :users
resources :films

resources :films do
  resources :reviews
  resources :drinks
end

get '/auth/facebook/callback' => 'sessions#create'

end
