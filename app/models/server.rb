class Server < ActiveRecord::Base
  validates_uniqueness_of :key
  validates_uniqueness_of :port, :scope => :hostname
  validates_presence_of :hostname, :port, :key
  
  named_scope :beating, lambda { { :conditions => ['updated_at > ?', 10.minutes.ago] } }
  
  # Server.dead.destroy
  named_scope :dead, lambda { { :conditions => ['updated_at < ?', 1.month.ago] } } do
    def destroy
      each { |i| i.destroy }
    end
  end
end
