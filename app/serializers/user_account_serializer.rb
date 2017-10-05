class UserAccountSerializer < ActiveModel::Serializer
  	attributes :id, :account_admin, :user_id, :account_id, :created_at

 	#belongs_to :user
 	#belongs_to :account

end
