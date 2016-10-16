module GithubHelper

	def starredJsonGem
		gh = Github
	end

	def authorize
		@github = Github.new basic_auth: 'vaskaloidis:Godzilla1!'
		@github.auth.create scopes: ['repo'], note: 'admin script'
		@activity = Github::Client::Activity.new
	end


end
