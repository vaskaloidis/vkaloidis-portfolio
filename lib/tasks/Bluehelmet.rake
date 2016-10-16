# rake Bluehelmet:import_wp

require 'redcarpet'
# require 'platform-api'
require 'Bluehelmet/Wordpress'
require 'Upmark'

namespace :Bluehelmet do
	desc "Import Wordpress"
	task :import_wp => :environment do

		puts "Starting Wordpress Import"

		wp    = Wordpress.new
		posts = wp.posts

		imgs = wp.images

		posts.each do |row|

			puts "*** Importing Article " + row["ID"] + " - " + row["post_title"] + " *** "

			imgs.each do |row| # Image
				puts row["img-data"]
				articles.img = row["img-data"] # TODO: Images for the post
			end

			# HTML -> Markdown
			# renderer = Redcarpet::Render::HTML.new(no_links: true, hard_wrap: true)
			# markdown = Redcarpet::Markdown.new(renderer, extensions = {})
			# article.content    = markdown.render(row["post_content"])
			# article.content    = Render::Markdown.new.render(row["post_content"])
			# filtered = HTMLPage.new :contents => row["post_content"]

			# postContent = ReverseMarkdown.convert(input, unknown_tags: :raise, github_flavored: true)

			puts row["post_content"]

			puts "*******************"

			puts "Converted to Markdown: "
			postContent = Upmark.convert(row["post_content"])
			puts postContent

			categories = wp.categories(row["ID"])

			article            = Article.new
			article.name       = row["post_title"]
			article.shortname  = row["post_name"]
			article.excerpt    = row["post_excerpt"]
			article.created_at = row["post_date"]
			article.updated_at = row["post_modified"]
			article.content    = postContent
			article.categories = categories

			if row["post_status"].equal?("publish")
				puts "Article Published"
				article.published = true
			elsif row["post_status"].equal?("draft")
				puts "Article Draft"
				article.published = false
			end

			article.save

			puts "Post added - " + article.name
		end

	end


	desc "View Post"
	task :view_post => :environment do
		wp = Wordpress.new
		wp.view(82).each do |row|

			puts row["post_content"]

			puts "*******************"

			puts "Convert to Markdown: "
			postContent = Upmark.convert(row["post_content"])
			puts postContent
			end
	end

	# Database
	desc "Reset Database"
	task :reset_database => :environment do
		Rake::Task["db:drop"].invoke
		Rake::Task["db:create"].invoke
		Rake::Task["db:migrate"].invoke
		Rake::Task["db:load"].invoke
	end



	desc "Convert Projects HTML to Markdown"
	task :convert_projects => :environment do

		Project.all.each do |project|
			puts project.name
			oldProject = project.content
			project.content = Upmark.convert(oldProject)
			project.save

		end

	end





	#  Clear Cache
	desc "Clear Cache"
	task :clear_cache => :environment do
		Rake::Task["tmp:clear"].invoke
		Rake::Task["tmp:cache:clear"].invoke
		Rake::Task["assets:clean"].invoke
	end
	desc 'Clear memcache'
	task clear_memcache: :environment do
		::Rails.cache.clear
		CACHE.flush
	end


	# HEROKU
	# heroku pg:reset HEROKU_POSTGRESQL_GOLD # Reset first
	# heroku pg:push vkaloidis HEROKU_POSTGRESQL_GOLD --app vkaloidis

	desc "Upload Database"
	task :push_db => :environment do
		heroku("pg:reset HEROKU_POSTGRESQL_GOLD", "vkaloidis")
		heroku("pg:push vkaloidis HEROKU_POSTGRESQL_GOLD", "vkaloidis")
	end

	def heroku(cmd, app_name)
		Bundler.with_clean_env do
			sh "heroku #{cmd} --app #{app_name}"
		end
	end

end
