Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  
  resources :home, only: [:index]
  resources :movies, only: [:index, :show]
  resources :users

  namespace :api do
    namespace :v1 do
      resources :movies, only: [:index, :show]
      resources :user_reviews, only: [:create]
      resources :review_votes, only: [:create]
    end
  end
end
