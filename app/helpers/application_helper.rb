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
		result = ''
		tag = ""
		tagHtml = ""
		case category
			when "Html"
				result = 'success'
				tag = 'html5'
			when "Java"
				result = 'warning'
				tag = 'coffee'
			when "Java EE"
				result = 'warning'
				tag = 'coffee'
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
				result = 'danger'
				tag = 'space-shuttle'
			when "MySQL"
				result = 'info'
				tag = 'database'
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
		return '<span class="tag tag-' + result + '">' + tagHtml + category + '</span> '
	end
end
