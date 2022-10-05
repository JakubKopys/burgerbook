require 'jsonapi/serializable'

class RestaurantsSerializer
  def initialize(renderer: JSONAPI::Serializable::Renderer.new)
    @renderer = renderer
  end
  def call(restaurants)
    json = @renderer.render(restaurants,
                            class: { Restaurant: SerializableRestaurant })

    JSON.dump(json)
  end
end
