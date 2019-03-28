source "https://rubygems.org"
ruby "2.3.1"
gem "rails", "~> 5.1", ">= 5.1.2"
# VASI.IO

gem 'dotenv-rails', :groups => [:development, :test]

gem "faraday-http-cache"
gem "yaml_db"
gem "marked-rails"
gem "redcarpet"
gem "paperclip"

# gem "rails-docker"
# gem "github_api"

# gem "reverse_markdown"
# gem "kramdown"
# gem "upmark"

# brew install imagemagick
# gem "paperclip", "~> 5.0.0"

# Bootstrap, Bootswatch, Font-Awesome, SASS
gem "bootstrap_form"
gem "bootswatch-rails"
gem "font-awesome-rails"
gem "bootstrap-sass", "~> 3.3.6"
gem "sass-rails", ">= 3.2"
gem "bootstrap-tagsinput-rails"

# Database
gem "pg"

# Use Puma as the app server
gem "puma", "~> 3.0"
# Use SCSS for stylesheets
# gem "sass-rails", "~> 5.0"
# Use Uglifier as compressor for JavaScript assets
gem "uglifier", ">= 1.3.0"
# Use CoffeeScript for .coffee assets and views
gem "coffee-rails", "~> 4.2"
# See https://github.com/rails/execjs#readme for more supported runtimes
gem "therubyracer", platforms: :ruby, require: 'v8'

# Use jquery as the JavaScript library
gem "jquery-rails"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
#gem "turbolinks", "~> 5" #TODO: Disable, if we end up never actually using it
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.5"
# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 3.0"
# Use ActiveModel has_secure_password
# gem "bcrypt", "~> 3.1.7"

# Use Capistrano for deployment
# gem "capistrano-rails", group: :development

group :development do
  # gem "pry"
  # gem "pry-rails"
  # gem "pry-byebug"
  # gem "binding_of_caller"
  gem "debug_inspector"
end

group :production do
  # gem "memcache", "~> 1.5", ">= 1.5.1"
  gem "rollbar"
  gem "foreman"
end

group :development, :test do
  gem "byebug", platform: :mri   # Call "byebug" anywhere in the code to stop execution and get a debugger console
  gem "awesome_print"
  gem "better_errors"
  gem "web-console" # Add to page: <%= console %>
  gem "listen", "~> 3.0.5"
  gem "spring"   # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring-watcher-listen", "~> 2.0.0"
end