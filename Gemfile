source 'http://rubygems.org'
source 'http://gems.github.com'

#############################################################
#	Rails
#############################################################

gem 'unicorn'

gem 'rails', '3.2.6'

group :assets do
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'sass-rails', '~> 3.2.3'
gem 'haml-rails'
gem 'jquery-rails', '1.0.16'
gem 'jquery_mobile-rails'
gem 'execjs'

#############################################################
#	Persistence
#############################################################

gem 'pg'

#############################################################
#	Views
#############################################################

gem 'formtastic'

#############################################################
#	Authentication
#############################################################

gem 'devise', '1.4.9'
gem 'devise_oauth2_providable', '1.0.5'
gem 'omniauth'

#############################################################
#	Back office
#############################################################

gem 'activeadmin', '~> 0.4.0'
gem 'meta_search', '>= 1.1.3'

#############################################################
#	Payments & transactions
#############################################################

gem 'iban-tools'

#############################################################
#	Configuration
#############################################################

gem 'rails_config'

#############################################################
#	Support
#############################################################

gem 'rake'
#gem 'nokogiri'
gem 'mail'
gem 'sendgrid'
gem 'httparty'
gem 'sitemap_generator'

#############################################################
#	Testing
#############################################################

group :test, :development do
  gem 'rspec', '~> 2.10.0'
  gem 'rspec-core', '~> 2.10.0'
  gem 'rspec-expectations', '~> 2.10.0'
  gem 'rspec-rails', '~> 2.10.0'
  gem 'autotest'
  gem 'autotest-standalone'
  gem 'autotest-rails'
  gem 'autotest-fsevent', '0.2.8'
  gem 'autotest-growl'
  gem 'guard'
  gem 'guard-rspec'
  gem 'database_cleaner'
  gem 'faker'
  gem 'factory_girl_rails', '~> 3.2.0'
  gem 'simplecov'
end

group :test do
  gem 'sqlite3-ruby', :require => 'sqlite3'
end

group :development do
  gem 'rails-footnotes'
  gem 'silent-postgres'
  gem 'ruby-debug19'
  gem 'pry'
end

