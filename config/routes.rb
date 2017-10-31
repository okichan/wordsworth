Rails.application.routes.draw do
  resources :profiles
  resources :questions
  devise_for :users
  root 'landing#index'
end
