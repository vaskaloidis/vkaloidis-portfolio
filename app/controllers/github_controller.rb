class GithubController < ApplicationController

	def starred
		url = 'https://api.github.com/users/vaskaloidis/starred'
		uri = URI(url)
		response = Net::HTTP.get(uri)
		json = JSON.parse(response)
		return json
	end

	def events
		url = 'https://api.github.com/users/vaskaloidis/events'
		uri = URI(url)
		response = Net::HTTP.get(uri)
		json = JSON.parse(response)
		return json
	end

	def starredJsonGem
		gh = Github
	end

	def authorize
		github = Github.new basic_auth: 'vaskaloidis:Godzilla1!'
		github.auth.create note: 'admin script'
	end

	def callback
		authorization_code = params[:code]
		access_token = github.get_token authorization_code
		access_token.token   # => returns token value
	end

	private

	def github
		@github ||= Github.new client_id: '...', client_secret: '...'
	end

end
