source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
ruby '2.6.3'
gem 'rails', '~> 5.1.6'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'active_model_serializers', '0.10'
gem 'bcrypt'
gem 'figaro'
gem 'omniauth-google-oauth2', '~> 1.0'
gem 'faraday'
gem 'mapbox-gl-rails'
gem 'jquery-rails'
gem 'bootstrap-sass', '2.0'
gem 'bootbox-rails', '~>0.4'
gem 'faraday_middleware'
gem 'sidekiq'
gem 'redis'
gem 'newrelic_rpm'
gem 'simple_scheduler'
gem 'sendgrid-ruby'
gem 'sinatra', '>= 1.3.0', :require => nil
gem 'filesaverjs-rails'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry'
  gem 'whenever', require: false
end

group :test do
  gem 'shoulda-matchers'
  gem 'database_cleaner'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'launchy'
  gem 'simplecov'
  gem 'capybara'
  gem 'vcr'
  gem 'webmock'
  gem 'minitest'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
