Rails.application.routes.draw do

  resources :projects

  root 'welcome#index'

  # map.login '/login', :controller => 'sessions', :action => 'new'
  get 'login', to: 'welcome#authenticate'
  # map_method.logout('/logout', :controller => 'sessions', :action => 'destroy')

end
