Rails.application.routes.draw do
 devise_for :users
 resources :books
 resources :users, only:[:show, :edit, :update]
 root :to => 'books#welcome'
end