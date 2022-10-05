require 'jsonapi/serializable'

class RestaurantsSerializer
  def call(restaurants)
    renderer = JSONAPI::Serializable::Renderer.new
    json = renderer.render(restaurants,
                           class: { Restaurant: SerializableRestaurant })

    JSON.dump(json)
  end
end
