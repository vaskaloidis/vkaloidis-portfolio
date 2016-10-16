require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Vkaloidis
	class Application < Rails::Application

		config.autoload_paths += ["#{Rails.root}/lib"]

		# config.action_controller.page_cache_directory = "#{Rails.root.to_s}/public/deploy"


#1		# Load the lib folder, a thousand times
		# config.autoload_paths += %W(#{config.root}/lib)
		# config.autoload_paths += Dir["#{config.root}/lib/**/"]
		# config.autoload_paths << "#{Rails.root}/lib"

#2		config.autoload_paths << Rails.root.join("lib")

#3		# config.autoload_paths += %W(#{config.root}/lib)

		# Settings in config/environments/* take precedence over those specified here.
		# Application configuration should go into files in config/initializers
		# -- all .rb files in that directory are automatically loaded.
	end
end
