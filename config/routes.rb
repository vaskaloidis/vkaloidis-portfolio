Rails.application.routes.draw do

	root 'welcome#index'

  get '/logout', to: 'admin#logout'

	resources :articles
		get '/article/:id', to: 'articles#view'
	resources :categories
	resources :projects

	# Authentication (Not working yet)
	get 'login', to: 'welcome#authenticate'
	# get '/logout', :controller => 'sessions', :action => 'destroy'

end
