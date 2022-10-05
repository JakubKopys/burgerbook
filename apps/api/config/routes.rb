# Configure your routes here
# See: https://guides.hanamirb.org/routing/overview
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }

# get 'api/v1/near-me', to:
get '/api/v1/near-me', to: 'restaurants#near_me'
