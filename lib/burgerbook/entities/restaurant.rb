class Restaurant < Hanami::Entity
  attributes do
    attribute :id,         Types::Int
    attribute :address,    Types::String
    attribute :city,       Types::String
    attribute :zip_code,   Types::String
    attribute :name,       Types::String
    attribute :created_at, Types::Time
    attribute :updated_at, Types::Time
  end
end
