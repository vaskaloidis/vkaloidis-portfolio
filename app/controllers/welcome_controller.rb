class WelcomeController < ApplicationController
	helper GithubHelper, ApplicationHelper
	def index
		# @featureBlog = false
		if Rails.env.production?
			@featureBlog = false
			@featureGithub = false
		else
			@featureBlog = ApplicationHelper::isTrue(ENV['BLOG_ENABLE'])
			@featureGithub = ApplicationHelper::isTrue(ENV['GITHUB_ENABLE'])
		end

		# Blog
		if @featureBlog
			postCount = Article.count
			@articlesTop = Article.first(10)
			@articlesBottom = Article.last(postCount - 10)
		end

		# Projects
		@projects = Project.all
		@half     = @projects.size / 2
		@count    = 0

		# Github
		if @featureGithub
			url         = 'https://api.github.com/users/vaskaloidis/events'
			uri         = URI(url)
			response    = Net::HTTP.get(uri)
			@eventsJson = JSON.parse(response)
			@eventsJson = nil

			url          = 'https://api.github.com/users/vaskaloidis/starred'
			uri          = URI(url)
			response     = Net::HTTP.get(uri)
			@starredJson = JSON.parse(response)
			@starredJson = nil

			# da7f08c3b6d1e33acb9b8ea115cff414dbd55c5e
			@github   = Github.new basic_auth: ENV['GITHUB_CREDENTIALS']
			# @github.auth.create scopes: ['repo'], note: 'admin script'
			@activity = Github::Client::Activity.new
		end
	end
end
