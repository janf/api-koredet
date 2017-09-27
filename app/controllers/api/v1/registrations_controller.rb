module Api::V1
	class RegistrationsController < Devise::RegistrationsController

	  private

	  def sign_up_params
	    params.require(:user).permit(:name, :nickname, :email, :password, :password_confirmation, :city)
	  end

	  def account_update_params
	    params.require(:user).permit(:name, :nickname, :email, :password, :password_confirmation, :current_password, :city)
	  end
	end
end