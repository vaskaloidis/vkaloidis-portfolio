source 'https://rubygems.org'
ruby '2.4.1'
gem 'rails', '~> 5.1', '>= 5.1.2'
# VASI.IO
gem 'dotenv-rails', :groups => [:development, :test]
gem 'faraday-http-cache'
gem 'yaml_db'
gem 'marked-rails'
gem 'redcarpet'
# gem 'github_api'
# gem 'reverse_markdown'
# gem 'kramdown'
# gem 'upmark'
# Bootstrap, Bootswatch, Font-Awesome, SASS
gem 'bootstrap_form'
gem 'bootswatch-rails'
gem 'font-awesome-rails'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'sass-rails', '>= 3.2'
gem 'bootstrap-tagsinput-rails'
# gem 'mdbootstrap-rails'
gem 'pg'
gem 'puma', '~> 3.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'jbuilder', '~> 2.5'
group :development do
  gem 'pry'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'binding_of_caller'
  gem 'debug_inspector'
end
group :production do
  # gem 'memcache', '~> 1.5', '>= 1.5.1'
  gem 'rollbar'
  gem 'foreman'
end
group :test do
  gem 'database_cleaner'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'simplecov', require: false
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem 'minitest-reporters'
end
group :development, :test do
  gem 'coveralls', require: false
  gem 'factory_bot'
  gem 'factory_bot_rails'
  gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
end
group :development do
  gem 'web-console' # Add to page: <%= console %>
  gem 'byebug', platform: :mri   # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'awesome_print'
  gem 'better_errors'
  gem 'listen', '~> 3.0.5'
  gem 'spring'   # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring-watcher-listen', '~> 2.0.0'
end
