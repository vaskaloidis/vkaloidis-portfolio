class MainController < ApplicationController
  helper GithubHelper, ApplicationHelper

  def index
    # @featureBlog = false
    @featureBlog = ApplicationHelper.isTrue(ENV['BLOG_ENABLE'])
    @featureGithub = ApplicationHelper.isTrue(ENV['GITHUB_ENABLE'])

    # Blog
    if @featureBlog
      postCount = Article.count
      if postCount > 0
        @articlesTop = Article.first(10)
        @articlesBottom = Article.last(postCount - 10)
      else
        @articlesTop = Article.all
        @articlesBottom = Article.all
      end

    end

    # Projects
    @projects = Project.order(order: :desc, categories: :asc).where(displayed: true)
    @half = @projects.size / 2
    @count = 0
    @columnSplit = false

    # Github
    if @featureGithub
      url = 'https://api.github.com/users/vaskaloidis/events'
      uri = URI(url)
      response = Net::HTTP.get(uri)
      @eventsJson = JSON.parse(response)
      @eventsJson = nil

      url = 'https://api.github.com/users/vaskaloidis/starred'
      uri = URI(url)
      response = Net::HTTP.get(uri)
      @starredJson = JSON.parse(response)
      @starredJson = nil

      # da7f08c3b6d1e33acb9b8ea115cff414dbd55c5e
      @github = Github.new basic_auth: ENV['GITHUB_CREDENTIALS']
      # @github.auth.create scopes: ['repo'], note: 'admin script'
      @activity = Github::Client::Activity.new

    end
  end
end
