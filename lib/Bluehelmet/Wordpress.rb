class Wordpress

	def initialize
		@client = Mysql2::Client.new(:host     => "localhost",
		                             :username => "root",
		                             :password => "root",
		                             :port     => "8889",
		                             :database => "wordpress",
		                             :socket   => "/Applications/MAMP/tmp/mysql/mysql.sock")
	end

	def posts
		query = @client.query("SELECT * FROM `wp_posts`
													 WHERE `post_status` = 'publish'
													AND `post_type` = 'post' ");
		return query
	end

	def images
		query = @client.query("SELECT * FROM `wp_posts`
													    WHERE `post_status` = 'publish'
															AND `post_type` = 'attachment' ");
		return query
	end

end