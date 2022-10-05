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
                       restaurant_serializer: RestaurantsSerializer.new,
                       errors_serializer: ErrorsSerializer.new)
          @interactor = interactor
          @restaurant_serializer = restaurant_serializer
          @errors_serializer = errors_serializer
        end

        def call(params)
          if params.valid?
            x = params[:x]
            y = params[:y]

            result = @interactor.call(x: x, y: y)

            if result.successful?
              restaurants = result.restaurants
              self.body = @restaurant_serializer.call(restaurants)
            else
              self.body = @errors_serializer.call(result.errors)
              self.status = 422
            end
          else
            self.body = JSON.dump({ errors: "Invalid parameters" })
            self.status = 422
          end
        end
      end
    end
  end
end
