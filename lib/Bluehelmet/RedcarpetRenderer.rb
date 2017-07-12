class RedcarpetRenderer < Redcarpet::Render::HTML
	# include  Redcarpet::Render::HTML
	# include Redcarpet::Render::SmartyPants


	def initialize(options)
		super(options)
	end

	def image(link, title, content)
		%(<img class="img-responsive" title="#{title}" src="#{link}">#{content} />)
	end

	# def block_html(raw_html)
	# 	raw_html.strip.gsub("\n", "<br>")
	# end
end