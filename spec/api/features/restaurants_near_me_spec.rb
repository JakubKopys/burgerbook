require_relative '../../api_helper'

describe 'Listing speakers' do
  it "returns list of near restaurants" do
    RestaurantRepository.new.clear

    header 'Content-Type', 'application/json;'
    get '/api/v1/near-me?x=1&y=2'

    expect(last_response.content_type).must_equal("application/json; charset=utf-8")
    response_body = JSON.parse(last_response.body)
    refute(response_body["data"].nil?)
    data = response_body.fetch("data")
    expect(data.length).must_equal(3)
    %w[a b c].each_with_index do |name, index|
      restaurant_data = data[index]
      expect(restaurant_data["id"]).must_be_instance_of(String)
      expect(restaurant_data["type"]).must_equal("restaurants")
      expect(restaurant_data["attributes"]).must_be_instance_of(Hash)
      attributes = restaurant_data["attributes"]
      expect(attributes["name"]).must_equal(name)
      expect(attributes["address"]).must_equal("address #{name}")
      expect(attributes["city"]).must_equal("city #{name}")
      expect(attributes["zip_code"]).must_equal("zip_code #{name}")
    end
  end
end
