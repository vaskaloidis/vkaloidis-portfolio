module ApplicationHelper
	require 'Bluehelmet/Parser'

	def self.isTrue(s)
		!!(s =~ /^(true|t|yes|y|1)$/i)
	end

	def convertMarkdown(markdown)
		return Parser.convertMarkdown(markdown)
	end

	def trimDescription(count, description)
		firstPart = description.split(" ").first(count).join(" ")
		firstPart = description[0..count]
		return firstPart
	end

	def buildCategoryIconHtml(categories)
		categories   = categories.split(',')
		categoryHtml = ""
		categories.each do |c|
			categoryHtml = categoryHtml + getCategoryIcon(c.strip)
		end
		return categoryHtml
	end

	def buildCategoryLabelHtml(categories)
		categories   = categories.split(',')
		categoryHtml = ""
		categories.each do |c|
			categoryHtml = categoryHtml + getCategoryLabel(c.strip)
		end
		return categoryHtml
	end


	def getCategoryLabel(category)
		result = ''
		tag    = ''
		case category
			when "Html"
				result = 'success'
				tag    = 'html5'
			when "Java"
				result = 'warning'
				tag    = 'coffee'
			when "Bootstrap"
			when "Java EE"
				result = 'warning'
				tag    = 'coffee'
			when "JavaFX"
				result = 'warning'
			when "MIPS"
				result = 'default'
				tag    = 'sort-numeric-desc'
			when "C++"
				result = 'primary'
				tag    = 'diamond'
			when "OpenGL"
				result = 'danger'
				tag    = 'cubes'
			when "SML"
				result = 'success'
				tag    = 'sort-alpha-desc'
			when "javascript"
			when "C"
				result = 'info'
				tag    = 'diamond'
			when "YACC"
				result = 'danger'
				tag    = 'flask'
			when "Circuit"
				result = 'default'
				tag    = 'laptop'
			when "PHP"
				result = 'danger'
				tag    = 'space-shuttle'
			when "MySQL"
				result = 'info'
				tag    = 'database'
			when "Mac OSX"
				result = 'info'
				tag    = 'apple'
			when "New"
				result = 'success'
				tag    = 'star'
			when "Python"
				result = 'primary'
				tag    = 'hashtag'
			when "Maven"
				result = 'default'
				tag    = 'gears'
			when "Maven MOJO"
				result = 'default'
				tag    = 'gears'
			when "Composer"
				result = 'info'
				tag    = 'gears'
			when "GitHub"
				result = 'info'
				tag    = 'github'
			when 'Updated'
				result = 'success'
				tag    = 'star'
		end

		if !tag.empty?
			return '<span class="label label-' + result + '">' + '<i class="fa fa-' + tag + '"></i>' + category + '</span> '
		else
			return ''
		end
	end


	def getCategoryIcon(category)
		devicon = ''
		case category
			when "Html"
				devicon = 'devicon-html5-plain'
			when "Bootstrap"
				devicon = 'devicon-bootstrap-plain-wordmark colored'
			when "Java EE"
			when "JavaFX"
			when "Java"
				devicon = 'devicon-java-plain-wordmark colored'
			when "MIPS"
			when "C++"
				devicon = 'devicon-cplusplus-line-wordmark colored'
			when "Laravel"
				devicon = 'devicon-laravel-plain-wordmark colored'
			when "Linux"
				devicon = 'devicon-linux-plain colored'
			when "OpenGL"
			when "SML"
			when "javascript"
				devicon = 'devicon-javascript-plain colored'
			when "C"
				devicon = 'devicon-c-line-wordmark colored'
			when "YACC"
			when "Circuit"
			when "PHP"
				devicon = 'devicon-php-plain colored'
			when "MySQL"
				devicon = 'devicon-mysql-plain-wordmark colored'
			when "Nodejs"
				devicon = 'devicon-nodejs-plain-wordmark colored'
			when "Photoshop"
				devicon = 'devicon-photoshop-line colored'
			when "Rails"
				devicon = 'devicon-rails-plain-wordmark colored'
			when "Ruby"
				devicon = 'devicon-ruby-plain-wordmark colored'
			when "Redis"
				devicon = 'devicon-redis-plain-wordmark colored'
			when "Mac OSX"
				devicon = 'devicon-apple-original colored'
			when "Sass"
				devicon = 'devicon-sass-original colored'
			when "Ubuntu"
				devicon = 'devicon-ubuntu-plain-wordmark colored'
			when "Apache"
				devicon = 'devicon-apache-plain-wordmark colored'
			when "Bower"
				devicon = 'devicon-bower-plain-wordmark colored'
			when "Wordpress"
				devicon = 'devicon-Bluehelmet-plain-wordmark colored'
			when "Css"
				devicon = 'devicon-css3-plain-wordmark colored'
			when "Hosted"
				devicon = 'devicon-docker-plain-wordmark colored'
			when "New"
			when "Python"
				devicon = 'devicon-python-plain-wordmark colored'
			when "Maven"
			when "Maven MOJO"
			when "Composer"
			when "MIPS"
				devicon = 'devicon-jeet-plain colored'
			when "GitHub"
				# devicon = 'devicon-github-plain-wordmark colored'
			when "Gulp"
				devicon = 'devicon-gulp-plain colored'
			when "Grunt"
				devicon = 'devicon-grunt-line-wordmark colored'
			when 'Updated'
			when "phpstorm"
				devicon = 'devicon-phpstorm-plain-wordmark colored'
		end

		if !devicon.empty?
			return '<i class="devicon ' + devicon + '"></i>'
		else
			return ''
		end
	end
end