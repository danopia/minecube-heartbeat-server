class Server < ActiveRecord::Base
  validates_uniqueness_of :key
  validates_presence_of :hostname, :port, :key
end
