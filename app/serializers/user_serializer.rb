class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :email, :city
end
