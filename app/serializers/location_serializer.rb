class LocationSerializer < ActiveModel::Serializer
  attributes :id, :location_name, :location_type
  has_many :children
end
