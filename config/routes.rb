Rails.application.routes.draw do

	root 'main#index'

	# match '/save_project', to: 'projects#save', via: [:put, :patch]
	# post '/save' => 'projects#save', as: "project_save"

	# get '/a/:id' => 'articles#view', as: "article_single"
	get '/p/:shortname' => 'projects#view',   as: "project_single"
	get '/p/raw/:shortname' => 'projects#view_raw', as: "project_raw"

	resources :articles
	resources :categories
	resources :projects

	get '/admin' => 'admin#index', as: "admin"
	get '/login' => 'admin#login', as: "login"
	get '/logout' => 'admin#logout', as: "logout"
	# get "/hello" => "clearance/users#new", as: "sign_up"

	# get '/logout', :controller => 'sessions', :action => 'destroy'

end
