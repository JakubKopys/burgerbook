class RestaurantRepository < Hanami::Repository
  def close_to_point(_x,_y)
    mock_data
  end

  private

  MOCK_RESTAURANT_NAMES = %w[a b c]

  def mock_data
    data = []

    MOCK_RESTAURANT_NAMES.each do |name|
      restaurant = restaurants.where(name: name).first

      if restaurant.nil?
        new_restaurant = create(
          name: name,
          address: "address #{name}",
          zip_code: "zip_code #{name}",
          city: "city #{name}"
        )
        data.push(new_restaurant)
      else
        data.push(restaurant)
      end
    end

    restaurants.where(name: MOCK_RESTAURANT_NAMES).to_a
  end
end
