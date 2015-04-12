MarketPlaceApi::Application.routes.draw do
# we are just going to set the constraints,
# the base_uri and the default response format for each request.

# We are going to isolate the api controllers under a namespace,
# in Rails this is fairly simple, just create a folder under the
# app/controllers named api, the name is important as it is the namespace
# we’ll use for managing the controllers for the api endpoints

# Defining namespace under 'api', By defining a namespace under the routes.rb file. Rails will
# automatically map that namespace to a directory matching the name under the
# controllers folder, in our case the api/ directory.

  namespace :api, defaults: { format: :json },
                  constraints: { subdomain: 'api' }, path: '/' do

  #   listing our resources here
  end


end
