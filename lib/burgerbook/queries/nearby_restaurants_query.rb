class NearbyRestaurantsQuery
  def initialize(repository: RestaurantRepository.new)
    @repository = repository
  end

  def call(_x,_y)
    # Location based query to find nearest restaurants, for example, from PostGIS database
    @repository.all
  end

  private

  MOCK_RESTAURANT_NAMES = ['a','b','c']

  def mock_data
    MOCK_RESTAURANT_NAMES.each do |name|
      @repository.where(name: name)
    end
  end
end
