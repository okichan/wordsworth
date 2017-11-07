Rails.application.routes.draw do
	devise_for :users
	root 'landing#index'
	
	resources :questions, except: [:edit, :update] do
		resources :answers
		collection do
			match 'search' => 'questions#search', via: [:get, :post], as: :search
		end
	end
	
	post 'questions/confirm' => 'questions#confirm'

	resources :charges
	
	resources :conversations do
		resources :messages
	end
	
	resources :profiles, only: [:show, :edit, :update]
	
	patch 'questions/confirm' => 'questions#confirm'
	put 'questions/confirm' => 'questions#confirm'
end
