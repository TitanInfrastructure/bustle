require 'active_support/dependencies'
require 'active_support/concern'

require "bustle/version"
require "bustle/concerns/filterable"
require "bustle/concerns/by_publisher"
require "bustle/concerns/for_subscriber"
require "bustle/concerns/resource_collection"
require "bustle/concerns/publisher_resource"
require "bustle/concerns/subscriber_resource"
require "bustle/concerns/target_resource"
require "bustle/activities"
require "bustle/publishers"
require "bustle/subscribers"
require "bustle/subscriptions"

module Bustle
  mattr_accessor :storage

  module Storage
    autoload :ActiveRecord, 'bustle/storage/active_record'
  end

  def self.config
    yield self

    require 'bustle/models/activity'
    require 'bustle/models/publisher'
    require 'bustle/models/subscriber'
    require 'bustle/models/subscription'

    require 'orm_adapter'
  end
end
