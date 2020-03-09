Rails.application.routes.draw do
 devise_for :users
 resources :books
 resources :users
 resources :books , only:[:new, :create, :index, :show] do
    resources :book_comments , only:[:create, :destroy]
    resource :favorites , only: [:create, :destroy]
 end
 get 'home/about' => 'homes#index'
 root 'books#welcome'
end