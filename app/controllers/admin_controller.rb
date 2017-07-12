class AdminController < ApplicationController
	# before_action :authenticate,
	# http_basic_authenticate_with name: @username, password: @password
	before_action :authenticate, only: [:login]


	@username = ENV['username']
	@password = ENV['password']


	def login
		# Nothing
	end

	def logout
		reset_session
	end

	private
	def authenticate
		authenticate_or_request_with_http_basic do |user_name, password|
			session[:admin] = (user_name == @username && password == @password)
		end
	end

end
