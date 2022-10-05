require 'hanami/interactor'

class RestaurantsNearMe
  include Hanami::Interactor

  def initialize(repository: RestaurantRepository.new)
    @repository = repository
  end

  expose :restaurants

  def call(x:, y:)
    @restaurants = @repository.close_to_point(x, y)
  end
end
