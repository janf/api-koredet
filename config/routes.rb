Rails.application.routes.draw do

  scope module: 'api' do
  	mount_devise_token_auth_for 'User', at: 'v1/auth'
  	namespace :v1 do
  		#devise_for :users, :controllers => { registrations: 'registrations' }
    	resources :users, only: [:index, :show, :update]
  	end
  end

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
