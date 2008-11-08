ActionController::Routing::Routes.draw do |map|
  map.logout    '/logout', :controller => 'sessions', :action => 'destroy'
  map.login     '/login', :controller => 'sessions', :action => 'new'
  map.register  '/register', :controller => 'judges', :action => 'create'
  map.signup    '/signup', :controller => 'judges', :action => 'new'

  map.resource :session, :vote
  map.resources :judges, :candidates
  
  # map.root :controller => "welcome"
  # map.connect ':controller/:action/:id'
  # map.connect ':controller/:action/:id.:format'
end
