require 'rubygems'
gem 'mongo', '< 1.0'
require 'light_mongo'

LightMongo.database = 'milk_sync'

Dir[File.join(File.dirname(__FILE__), "milk_sync/*.rb")].sort.each { |f| require f }

module MilkSync
end
