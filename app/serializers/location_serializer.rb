class LocationSerializer < ActiveModel::Serializer
  attributes :id, :location_name, :location_type, :parent_id, :ancestry
  has_many :children

  def places
    object.places.order("location_name")
  end

end
