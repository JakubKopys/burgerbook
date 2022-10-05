class User < Hanami::Entity
  attributes do
    attribute :id,         Types::Int
    attribute :first_name, Types::String
    attribute :last_name,  Types::String
    attribute :email,      Types::String
    # maybe delete that and move to the many-to-many record
    attribute :admin,      Types::Bool

    attribute :created_at, Types::Time
    attribute :updated_at, Types::Time

    # attribute :accounts, Types::Collection(Account)
  end
end
