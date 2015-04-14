require 'api_constraints'

MarketPlaceApi::Application.routes.draw do
  mount SabisuRails::Engine => "/sabisu_rails"
  devise_for :users
# we are just going to set the constraints,
# the base_uri and the default response format for each request.

# We are going to isolate the api controllers under a namespace,
# in Rails this is fairly simple, just create a folder under the
# app/controllers named api, the name is important as it is the namespace
# we’ll use for managing the controllers for the api endpoints

# Defining namespace under 'api', By defining a namespace under the routes.rb file. Rails will
# automatically map that namespace to a directory matching the name under the
# controllers folder, in our case the api/ directory.
  # Api definition
  namespace :api, defaults: { format: :json },
                  constraints: { subdomain: 'api' }, path: '/' do

      scope module: :v1,
            constraints: ApiConstraints.new(version: 1, default: true) do
        # we are going to list resources below
        resources :users, :only => [:show, :create, :update, :destroy]

      end
    end


end

