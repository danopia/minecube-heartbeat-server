class Server < ActiveRecord::Base
  validate_uniqueness_of :key
  validate_presence_of :hostname, :port, :key
end
