class MainController < ApplicationController
	helper GithubHelper, ApplicationHelper

	def index
		# @featureBlog = false
		@featureBlog   = ApplicationHelper.isTrue(ENV['BLOG_ENABLE'])
		@featureGithub = ApplicationHelper.isTrue(ENV['GITHUB_ENABLE'])

		# Blog
		if @featureBlog
			postCount = Article.count
			if postCount > 0
				if postCount > 10
					@articlesTop    = Article.first(10)
					@articlesBottom = Article.last(postCount - 10)
				else
					@articlesTop    = Article.all
					@articlesBottom = Article.first(0)
				end

			else
				@articlesTop    = Article.all
				@articlesBottom = Article.all
			end

		end

		# Projects
		@featured = Project.order(created_at: :desc)
			 .where(sticky: true, displayed: true)

		@websites        = Project.order(created_at: :desc)
			 .where.not(sticky: true)
			 .where(website: true)
			 .where(displayed: true)

		@everything = Project.order(categories: :asc)
			 .where(displayed: true)
			 .where(sticky: [false, nil])
			 .where(website: [false, nil])

		@projects = Array.new
		@projects.push(*@featured)
		@projects.push(*@websites)
		@projects.push(*@everything)


		@half        = @projects.size / 2
		@count       = 0
		@columnSplit = false

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
			@github = Github.new basic_auth: ENV['GITHUB_CREDENTIALS']
			# @github.auth.create scopes: ['repo'], note: 'admin script'
			@activity = Github::Client::Activity.new

		end
	end
end
