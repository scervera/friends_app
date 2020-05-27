Rails.application.routes.draw do
  get 'home/index'
  resources :friendships
  devise_for :users
  root to: "home#index"
end
