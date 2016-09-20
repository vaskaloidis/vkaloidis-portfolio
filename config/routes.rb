Rails.application.routes.draw do

	# Projects
  resources :projects

  # Main Page
  root 'welcome#index'

  # Authentication (Not working yet)
  get 'login', to: 'welcome#authenticate'
	# get '/logout', :controller => 'sessions', :action => 'destroy'

end
