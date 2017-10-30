Rails.application.routes.draw do
  resources :profiles
  resources :questions
  devise_for :users
  root to: "questions#index"
end
