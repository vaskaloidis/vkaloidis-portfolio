Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
	root 'welcome#index'

	get '/admin', to: 'admin#index'

	resources :articles
		get '/article/:id', to: 'articles#view'
	resources :categories
	resources :projects

	# Authentication (Not working yet)
	get 'login', to: 'welcome#authenticate'
	# get '/logout', :controller => 'sessions', :action => 'destroy'

end
