RailsAdmin.config do |config|

	config.model Article do
		edit do
			field :content, :froala
		end
	end

	config.authorize_with do
		authenticate_or_request_with_http_basic('Login required') do |username, password|
			github = ENV['GITHUB_CREDENTIALS'].split(":")

			user = User.where(email: 'vas', password: 'password', admin: true).first

			# user   = User.where(email: github[0], password: github[1], admin: true).first
			user
		end
	end

	config.actions do
		dashboard # mandatory
		index # mandatory
		new
		export
		bulk_delete
		show
		edit
		delete
		show_in_app

		## With an audit adapter, you can add:
		# history_index
		# history_show
	end
end
