ActionController::Routing::Routes.draw do |map|
  map.servers 'servers.txt', :controller => :servers, :action => :plaintext, :conditions => { :method => :get }
  
  map.resources :servers

  map.connect 'beat/:key', :controller => :servers, :action => :beat, :conditions => { :method => :post }
  map.beat    'beat',      :controller => :servers, :action => :beat, :conditions => { :method => :post }
  map.root                 :controller => :servers, :action => :index
end
