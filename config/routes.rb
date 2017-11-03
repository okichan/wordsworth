Rails.application.routes.draw do
  devise_for :users
  root 'landing#index'
  resources :conversations do
    resources :messages
  end
  resources :profiles, only: [:show, :edit, :update]
  resources :questions do
    resources :answers
  end
end
