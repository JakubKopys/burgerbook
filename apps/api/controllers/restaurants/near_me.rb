require 'jsonapi/serializable'

module Api
  module Controllers
    module Restaurants
      class NearMe
        include Api::Action

        params do
          required(:x).filled(:int?)
          required(:y).filled(:int?)
        end

        def initialize(interactor: RestaurantsNearMe.new,
                       serializer: RestaurantsSerializer.new)
          @interactor = interactor
          @serializer = serializer
        end

        def call(params)
          if params.valid?
            x = params[:x]
            y = params[:y]

            result = @interactor.call(x: x, y: y)

            # # TODO: check interactor result
            restaurants = result.restaurants
            self.body = @serializer.call(restaurants)
          else
            self.body = JSON.dump({errors: "Invalid parameters"})
            self.status = 422
          end
        end
      end
    end
  end
end
