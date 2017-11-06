Rails.application.routes.draw do
  devise_for :users
  root 'landing#index'
  resources :charges
  
  resources :conversations do
    resources :messages
  end
  resources :profiles, only: [:show, :edit, :update]
  resources :questions do
    resources :answers
		collection do
			match 'search' => 'questions#search', via: [:get, :post], as: :search
		end
  end
end
