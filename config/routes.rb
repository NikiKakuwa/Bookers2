Rails.application.routes.draw do
 devise_for :users
 resources :books
 resources :users
 resources :books , only:[:new, :create, :index, :show] do
    resource :book_comments , only:[:create]
 end
 get 'home/about' => 'homes#index'
 root 'books#welcome'
end