class User < ActiveRecord::Base
  	# Include default devise modules.
  	devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
  	include DeviseTokenAuth::Concerns::User

  	has_many :user_accounts
 	  has_many :accounts,  :through => :user_accounts
  
  	belongs_to :current_account, class_name: "Account"

  	def current_account_admin?
	  	ua = UserAccount.where(account_id: current_account.id, user_id: self.id).first
	  	if ua.present?
	  		return ua.account_admin
	  	else
	  	 	return false	
	  	end 
	 end

end
