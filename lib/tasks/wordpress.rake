# rake Bluehelmet:import_wp

require 'redcarpet'

namespace :Bluehelmet do
	desc "Blue Helmet Software"
	task :import_wp => :environment do

		require 'Bluehelmet/Wordpress'
		puts "Starting Wordpress Import"

		# renderer = Redcarpet::Render::HTML.new(no_links: true, hard_wrap: true)
		# markdown = Redcarpet::Markdown.new(renderer, extensions = {})

		wp = Wordpress.new
		posts = wp.posts
		imgs  = wp.images

		posts.each do |row|
			puts "Adding Article"
			article            = Article.new
			article.name       = row["post_title"]
			article.shortname  = row["post_name"]

			article.content = Upmark.convert(row["post_content"])
			puts article.content

			# article.content    = markdown.render(row["post_content"])
			# article.content    = Render::Markdown.new.render(row["post_content"])
			# article.categories = row["category"] # TODO: Get tags from wp_terms table + find relationship to post

			article.created_at = row["post_date"]
			article.updated_at = row["post_modified"]

			# imgs.each do |row| # Image
				# puts row["img-data"]
				# articles.img = row["img-data"] # TODO: Images for the post
			# end

			article.save
			puts "Article " + article.name + " (" + article.shortname + ")"
		end
	end

end
