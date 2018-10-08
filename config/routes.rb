Rails.application.routes.draw do
	get 'home/index'
	root 'home#index'

	#devise
	devise_for :users, controllers: {
		registrations: 'users/registrations',
		omniauth_callbacks: "users/omniauth_callbacks"
  	}    
  	devise_scope :user do
		get 'sign_out', to: "sessions#destroy"
   	end

   	namespace :api, { format: 'json' } do
		namespace :v1 do # バージョン1を表している
		  	resources :users, only:[:show] do
		    	collection  do
		        	get 'tokenid/:id' => 'users#tokenid', as:'tokenid'
		        	get 'chatwork_me/:id' => 'users#chatwork_me', as:'chatwork_me'
		    	end
	    	end
		end
	end
end
