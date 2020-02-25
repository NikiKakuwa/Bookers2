Rails.application.routes.draw do
 devise_for :users
 resources :books
 resources :users
 # resources :homes
 get 'home/about' => 'homes#index'
 root 'books#welcome'
end