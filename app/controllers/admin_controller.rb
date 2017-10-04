class AdminController < ApplicationController
	# http_basic_authenticate_with name: @username, password: @password, except: :view
	before_action :authenticate, except: :view

	def login
		# Nothing
	end

	def logout
		reset_session
	end

	private
	def authenticate
		authenticate_or_request_with_http_basic do |user_name, password|
			session[:admin] = (user_name ==  'vas' && password ==  'Maxima2017!')
		end
	end

end
