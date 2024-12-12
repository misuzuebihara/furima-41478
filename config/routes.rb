Rails.application.routes.draw do
  devise_for :users
  get 'items/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :items, only: [:index, :new, :create]

  root to: 'items#index'
end
