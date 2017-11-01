Rails.application.routes.draw do
  resources :profiles
  resources :questions do
    resources :answers
  end
  devise_for :users
  root 'landing#index'
end
