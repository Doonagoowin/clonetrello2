Rails.application.routes.draw do
  devise_for :users

  root 'boards#index'
    
  resources :boards
  resources :cards
  resources :lists
  resources :items
end
