class AccountSerializer < ActiveModel::Serializer
  attributes :id, :account_name 
  #has_many :users, through: :account_user
end
