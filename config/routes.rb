Rails.application.routes.draw do

  namespace :api do
    namespace :v1  do 
      resources :posts, only: [:index] do
        resources :comments, only: [:create, :index]
      end
    end
  end

  devise_for :users

  default_url_options :host => 'localhost'

  devise_scope :user do
    # write all your routes inside this block
    root 'users#index'
    resources :users, only: [:index, :show] do
      resources :posts, only: [:index, :new, :create, :show]
    end
  
    resources :posts do
      resources :comments, only: [:create, :destroy]
      resources :likes, only: [:create]
    end
  end
  
  end