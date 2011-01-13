ActionController::Routing::Routes.draw do |map|
  map.resources :servers

  map.connect 'beat/:key', :controller => :servers, :action => :beat
  map.beat    'beat',      :controller => :servers, :action => :beat
  map.root                 :controller => :servers, :action => :index
end
