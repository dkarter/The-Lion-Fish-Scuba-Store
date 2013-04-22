source 'https://rubygems.org'

gem 'rails', '3.2.8'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'




# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem "therubyracer"
gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem "twitter-bootstrap-rails"

#gem 'foreigner' # adds foriegn key to migrations
gem 'validates_timeliness'

group :production do
	gem 'pg'
	gem 'thin'
end

group :development, :test do
	gem 'debugger'

	gem 'sqlite3'
	gem 'immigrant'
	gem 'cucumber'
	gem 'cucumber-rails', require: false
	gem 'rspec'
	gem 'rspec-rails'
	gem 'capybara'
	gem 'database_cleaner'
	gem 'factory_girl_rails', '~> 4.0'	
	gem 'capybara-webkit', git: 'git://github.com/thoughtbot/capybara-webkit.git' # requires 'brew install qt' # https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

