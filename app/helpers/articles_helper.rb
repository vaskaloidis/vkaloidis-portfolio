module ArticlesHelper

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
