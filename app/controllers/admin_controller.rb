class AdminController < ApplicationController
	@username = ENV['username']
	@password = ENV['password']

	http_basic_authenticate_with name: @username, password: @password

	def index
		@projects = Project.all
		@articles = Article.all
	end

end
