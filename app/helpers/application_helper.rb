module ApplicationHelper

	def trimDescription(count, description)
		firstPart = description.split(" ").first(count).join(" ")
		firstPart = description[0..count]
		return firstPart
	end

	def buildCategoryHtml(categories)
		categories = categories.split(',')
		categoryHtml = ""
		categories.each do |c|
			categoryHtml = categoryHtml + getCategoryButton(c.strip)
		end
		return categoryHtml
	end

	def getCategoryButton(category)
		type    = 'not-devicon'
		result  = ''
		tag     = ''
		devicon = ''
		tagHtml = ''
		case category
			when "Html"
				result  = 'success'
				tag     = 'html5'
				devicon = 'devicon-html5-plain'
			when "Java"
				result  = 'warning'
				tag     = 'coffee'
				devicon = 'devicon-java-plain'
			when "Java EE"
				result  = 'warning'
				tag     = 'coffee'
				devicon = 'html5'
			when "JavaFX"
				result = 'warning'
			when "MIPS"
				result = 'default'
				tag = 'sort-numeric-desc'
			when "C++"
				result = 'primary'
				tag = 'diamond'
			when "OpenGL"
				result = 'danger'
				tag = 'cubes'
			when "SML"
				result = 'success'
				tag = 'sort-alpha-desc'
			when "C"
				result = 'info'
				tag = 'diamond'
			when "YACC"
				result = 'danger'
				tag = 'flask'
			when "Circuit"
				result = 'default'
				tag = 'laptop'
			when "PHP"
				result  = 'danger'
				tag     = 'space-shuttle'
				devicon = 'devicon-php-plain colored'
			when "MySQL"
				result  = 'info'
				tag     = 'database'
				devicon = 'devicon-mysql-plain-wordmark colored'
			when "Mac OSX"
				result = 'info'
				tag = 'apple'
			when "New"
				result = 'success'
				tag = 'star'
			when "Python"
				result = 'primary'
				tag = 'hashtag'
			when "Maven"
				result = 'default'
				tag = 'gears'
			when "Maven MOJO"
				result = 'default'
				tag = 'gears'
			when "Composer"
				result = 'info'
				tag = 'gears'
			when "GitHub"
				result = 'info'
				tag = 'github'
			when 'Updated'
				result = 'success'
				tag = 'star'
		end

		if !tag.empty?
			tagHtml = ' <i class="fa fa-' + tag + '"></i> '
		end
		if type == 'devicon'
			if !devicon.empty?
				return '<i class="' + devicon + '"></i>'

			else
				return ''
				# return '<span class="tag tag-' + result + '">' + tagHtml + category + '</span> '
			end
		else
			return '<span class="label label-' + result + '">' + tagHtml + category + '</span> '
		end
	end
end
