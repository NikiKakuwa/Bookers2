Rails.application.routes.draw do
 devise_for :users
 resources :books
 resources :users
 resources :homes
 root :to => 'books#welcome'
end