class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :nickname, :name, :address, :city, :zip_code, :country, :phone_number, :current_account_id

  has_many :user_accounts
  #has_many :accounts, through: :user_accounts
 
end
