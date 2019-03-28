module ApplicationHelper
	require 'Bluehelmet/Parser'
	def self.isTrue(s)
		!!(s =~ /^(true|t|yes|y|1)$/i)
	end
	def convert_markdown(markdown)
		return Parser.convert_markdown(markdown)
	end
	def trimDescription(count, description)
		firstPart = description.split(" ").first(count).join(" ")
		firstPart = description[0..count]
		return firstPart
	end
	def buildCategoryIconHtml(categories, frontpage = false)
		categories   = categories.split(',')
		categoryHtml = ""
	  count = 0
		categories.each do |c|
			if frontpage && count > 4
				# Do nothing
			else
				categoryHtml = categoryHtml + getCategoryIcon(c.strip)
			end
			count = count + 1
		end
		return categoryHtml
	end
	def containsCategory(category, categories)
		categories = categories.split(',')
		categories.map!(&:downcase)
		return false
		# if categories.includes?(category)
		# 	return true
		# else
		# 	return false
		# end
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
			when "Java EE"
				result = 'warning'
				tag    = 'coffee'
			when "JavaFX"
				result = 'warning'
			when "MIPS"
				result = 'default'
				tag    = 'sort-numeric-desc'
			when "OpenGL"
				result = 'danger'
				tag    = 'cubes'
			when "SML"
				result = 'success'
				tag    = 'sort-alpha-desc'
			when "YACC"
				result = 'danger'
				tag    = 'flask'
			when "Circuit"
				result = 'default'
				tag    = 'laptop'
			when "New"
				result = 'success'
				tag    = 'star'
			when "Maven"
				result = 'default'
				tag    = 'gears'
			when "Maven MOJO"
				result = 'default'
				tag    = 'gears'
			when "Composer"
				result = 'info'
				tag    = 'gears'
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

  def buildCategorySelect(cats)
		array = Array.new
		count = 0
		cats.split(",") do |c|
			h = Hash.new
			h.store(count, c)
			array.puts(h)
			count = count + 1
		end
		return array
	end

  # TODO: Make this dynamically iterate through DB,
  #   and build Categories list from Categories set in
  #   each project
  def getCategories()
		cat = Array.new
		cat.push("heroku")
		cat.push("go")
		cat.push("github")
		cat.push("docker")
		cat.push("css")
		cat.push("apache")
		cat.push("html")
		cat.push("bootstrap")
		cat.push("java ee")
		cat.push("javafx")
		cat.push("java")
		cat.push("jquery")
		cat.push("mips")
		cat.push("c++")
		cat.push("laravel")
		cat.push("linux")
		cat.push("opengl")
		cat.push("sml")
		cat.push("javascript")
		cat.push("mongo db")
		cat.push("c")
		cat.push("yacc")
		cat.push("circuit")
		cat.push("php")
		cat.push("mysql")
		cat.push("node js")
		cat.push("photoshop")
		cat.push("rails")
		cat.push("postgres")
		cat.push("ruby")
		cat.push("redis")
		cat.push("mac osx")
		cat.push("sass")
		cat.push("ubuntu")
		cat.push("bower")
		cat.push("wordpress")
		cat.push("css")
		cat.push("hosted")
		cat.push("python")
		cat.push("maven")
		cat.push("maven mojo")
		cat.push("composer")
		cat.push("mips")
		cat.push("gulp")
		cat.push("grunt")
		cat.push("phpstorm")
		cat.push("react")
		cat.push("swift")
		cat.push("wordpress")
		cat.push("tomcat")
		cat.push("redis")
		cat.push("travis")
		return cat
	end

  def buildCategoryCsv(cats)
		cat = getCategories

		allCats = ""

		firstRun = true

		cat.each do |c|
			if firstRun
				allCats = c
				firstRun = false
			else
				allCats = allCats + ", " + c
			end
			return allCats.to_s
		end

		return allCats
	end

  def getAllCategories()
		cat = getCategories

		allCats = ""

		cat.each do |c|
			allCats = allCats + "<option value='" + c + "'>" + c + "</option>"
		end

		return allCats
	end

	def getGreatestSort
		greatest = 0
		Project.all do |p|
			if p.order > greatest
				greatest = p.order
			end
		end
		return greatest
	end


	def getCategoryIcon(category)
		devicon = ''
		case category.downcase
			when "heroku"
				devicon = 'devicon-heroku-plain-wordmark colored'
			when "go"
				devicon = 'devicon-go-line colored'
			when "github"
				devicon = 'devicon-github-plain-wordmark colored'
			when "docker"
				devicon = 'devicon-docker-plain-wordmark colored'
			when "css"
				devicon = 'devicon-css3-plain colored'
			when "apache"
				devicon = 'devicon-apache-plain-wordmark colored'
			when "html"
				devicon = 'devicon-html5-plain-wordmark colored'
			when "bootstrap"
				devicon = 'devicon-bootstrap-plain-wordmark colored'
			when "java ee"
			when "javafx"
			when "java"
				devicon = 'devicon-java-plain-wordmark colored'
			when "jquery"
				devicon = 'devicon-jquery-plain-wordmark colored'
			when "mips"
			when "c++"
				devicon = 'devicon-cplusplus-plain colored'
			when "laravel"
				devicon = 'devicon-laravel-plain-wordmark colored'
			when "linux"
				devicon = 'devicon-linux-plain colored'
			when "opengl"
			when "sml"
			when "javascript"
				devicon = 'devicon-javascript-plain colored'
			when "mongo db"
				devicon = 'devicon-mongodb-plain-wordmark colored'
			when "c"
				devicon = 'devicon-c-line-wordmark colored'
			when "yacc"
			when "circuit"
			when "php"
				devicon = 'devicon-php-plain colored'
			when "mysql"
				devicon = 'devicon-mysql-plain-wordmark colored'
			when "node js"
				devicon = 'devicon-nodejs-plain colored'
			when "photoshop"
				devicon = 'devicon-photoshop-line colored'
			when "rails"
				devicon = 'devicon-rails-plain-wordmark colored'
			when "postgres"
				devicon = 'devicon-postgresql-plain-wordmark colored'
			when "ruby"
				devicon = 'devicon-ruby-plain-wordmark colored'
			when "redis"
				devicon = 'devicon-redis-plain-wordmark colored'
			when "mac osx"
				devicon = 'devicon-apple-original colored'
			when "sass"
				devicon = 'devicon-sass-original colored'
			when "ubuntu"
				devicon = 'devicon-ubuntu-plain-wordmark colored'
			when "bower"
				devicon = 'devicon-bower-plain-wordmark colored'
			when "wordpress"
				devicon = 'devicon-Bluehelmet-plain-wordmark colored'
			when "css"
				# devicon = 'devicon-css3-plain-wordmark colored'
			when "hosted"
				devicon = 'devicon-docker-plain-wordmark colored'
			when "python"
				devicon = 'devicon-python-plain-wordmark colored'
			when "maven"
			when "maven mojo"
			when "composer"
			when "mips"
			when "gulp"
				devicon = 'devicon-gulp-plain colored'
			when "grunt"
				devicon = 'devicon-grunt-line-wordmark colored'
			when "phpstorm"
				devicon = 'devicon-phpstorm-plain-wordmark colored'
			when "react"
				devicon = 'devicon-react-original-wordmark colored'
			when "swift"
				devicon = 'devicon-swift-plain-wordmark colored'
			when "wordpress"
				devicon = 'devicon-wordpress-plain-wordmark colored'
			when "tomcat"
				devicon = 'devicon-tomcat-line-wordmark colored'
			when "redis"
				devicon = 'devicon-redis-plain-wordmark colored'
			when "travis"
				devicon = 'devicon-travis-plain-wordmark colored'
		end

		if !devicon.empty?
			return '<i class="devicon ' + devicon + '"></i>'
		else
			return ''
		end
	end
end
