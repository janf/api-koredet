Rails.application.routes.draw do

  resources :items
  scope module: 'api' do
  	mount_devise_token_auth_for 'User', at: 'v1/auth'
  	namespace :v1,  defaults: { format: :json }  do
  		#devise_for :users, :controllers => { registrations: 'registrations' }
    	resources :users, only: [:index, :show, :update] do
    		member do
    			get 'user_accounts'
    		end
    	end

    	resources :accounts do
    		member do
    			get 'users'
    			post 'add_user'
    		end
    	end

      resources :locations

      resources :items

  	end
  end

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
