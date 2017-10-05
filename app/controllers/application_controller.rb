class ApplicationController < ActionController::API
  extend ActsAsTenant::ControllerExtensions   
  include ActionController::Helpers           #needed by acts_as_tennant
	include DeviseTokenAuth::Concerns::SetUserByToken

	set_current_tenant_through_filter    

	prepend_before_action :configure_permitted_parameters, if: :devise_controller?

	before_action :find_current_account

	protected

  	def find_current_account
      if user_signed_in?
        puts current_user
        if !current_user.current_account_id.nil?
          puts "Current account id: " + current_user.current_account_id.to_s
          account = Account.find(current_user.current_account_id)
          if !account.nil?
      	     set_current_tenant(account)
          else
            set_current_tenant(0)
          end  
        else
          set_current_tenant(0)
        end
      else 
          set_current_tenant(0)
      end
  	end


  	def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:city])
    	devise_parameter_sanitizer.permit(:registration, keys: [:city])
  	end

end
