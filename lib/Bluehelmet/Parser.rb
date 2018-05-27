require 'Bluehelmet/RedcarpetRenderer'
# Parser for converting Markdown to HTML
class Parser
	def self.convert_markdown(md)
		unless md.nil?
	    options = {
	      no_intra_emphasis: true,
	      tables: true,
	      fenced_code_blocks: true,
	      autolink: true,
	      disable_indented_code_blocks: false,
	      lax_spacing: true,
	      space_after_headers: false
	    }
	    custom_renderer = RedcarpetRenderer.new(options)
	    default_renderer = Redcarpet::Render::HTML.new(options)
	    redcarpet_options = {
	        filter_html: false,
	        hard_wrap: true,
	        prettify: true
	    }
			redcarpet = Redcarpet::Markdown.new(custom_renderer, redcarpet_options)
		return redcarpet.render(md)
		 # return Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true).render(md)
	 else
		 md
    end
  end
end
