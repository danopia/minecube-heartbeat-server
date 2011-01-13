class Server < ActiveRecord::Base
  validates_uniqueness_of :key
  validates_uniqueness_of :port, :scope => :hostname
  validates_presence_of :hostname, :port, :key
end
