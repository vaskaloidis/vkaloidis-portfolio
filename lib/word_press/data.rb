module WordPress
	class Data
		attr_reader :row

		def initialize
			client = Mysql2::Client.new(:host     => "localhost",
			                            :username => "root",
			                            :password => "root",
			                            :port     => "8889",
			                            :database => "wordpress",
			                            :socket   => "/Applications/MAMP/tmp/mysql/mysql.sock");
			query = client.query("SELECT * FROM `wp_posts`")
		end

		def posts
			query.each do |row|
				Article::
							end
			end

			def html
				Render::HTML.new.render(markdown)
			end

			def markdown
				return @markdown unless @mardown.nil?

				@markdown = Render::Markdown.new.render(content)
			end

			def format_syntax_highlighter(text)
				text.gsub(/\[(\w+)\](.+?)\[\/\1\]/m) do |match|
					"\n```#{$1}#{$2}```\n"
				end

			end
		end
	end
end