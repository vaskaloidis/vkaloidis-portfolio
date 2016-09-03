Rails.application.routes.draw do

  resources :projects
	resources :projects

    root 'welcome#index'
end
