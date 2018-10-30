Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :users
resources :films

resources :films do
  resources :reviews
  resources :drinks
end

root 'welcome#home'

get '/auth/facebook/callback' => 'sessions#create'

end
