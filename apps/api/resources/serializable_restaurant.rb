class SerializableRestaurant < JSONAPI::Serializable::Resource
  type 'restaurants'

  attributes :name, :address, :city, :zip_code
end
