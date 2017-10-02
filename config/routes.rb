Rails.application.routes.draw do

	root 'main#index'

	get '/a/:id' => 'articles#view', as: "article_single"
	# get '/:id' => 'projects#view', as: "project_single"

	resources :articles
	resources :categories
	resources :projects

	get 'admin' => 'admin#index', as: "admin"
	get 'login' => 'admin#login', as: "login"
	get 'logout' => 'admin#logout', as: "logout"
	# get "/hello" => "clearance/users#new", as: "sign_up"

	# get '/logout', :controller => 'sessions', :action => 'destroy'

end
