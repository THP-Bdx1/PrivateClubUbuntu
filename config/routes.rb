Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root   'static_pages#home'
get    '/signup',  to: 'users#new'
post   '/signup',  to: 'users#create'
get    '/login',   to: 'sessions#new'
post   '/login',   to: 'sessions#create'
get '/logout',  to: 'sessions#destroy'
delete '/logout',  to: 'sessions#destroy'

get '/club', to: 'static_pages#index'

resources :users
end
