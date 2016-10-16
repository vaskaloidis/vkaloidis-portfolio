class Parser
	require 'Bluehelmet/RedcarpetRenderer'
	def self.convertMarkdown(markdown)
		redcarpet =
			 Redcarpet::Markdown.new(
					RedcarpetRenderer,
					prettify:                    true,
					filter_html:                 false,
					autolink:                    true,
					space_after_headers:         true,
					no_intra_emphasis:           true,
					hard_wrap:                   true,
					tables:                      true,
					disable_indented_code_block: true)

		return redcarpet.render(markdown)
	end

end