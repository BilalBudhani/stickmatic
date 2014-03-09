source 'https://rubygems.org'

ruby '2.1.1'

gem 'rails', '4.0.3'
gem 'pg'
gem 'sass-rails', '~> 4.0.0'
gem 'bootstrap-sass', '~> 3.1.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'slim-rails'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem "devise", "~> 3.2.2"
gem "instagram", "~> 0.10.0"
gem "omniauth-instagram", "~> 1.0.1"
gem "rails_config", "~> 0.3.3"
gem "faraday", "~> 0.8.9"
gem "foreman", "~> 0.63.0"
gem "font-awesome-rails"

gem 'activeadmin', github: 'gregbell/active_admin'
gem 'chosen-rails'
gem 'cancan'

group :development do
  gem "better_errors", "~> 1.0.1"
  gem "binding_of_caller", "~> 0.7.2"
  gem "meta_request", "~> 0.2.8"

end

group :development, :test do
  gem 'pry-rails'
  gem 'pry-nav'
  gem 'factory_girl_rails'
  gem 'spring-commands-rspec'
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'rb-fsevent' if `uname` =~ /Darwin/
  gem 'railroady'
end

group :test do
  gem "webmock", "~> 1.17.3"
  gem "faker", "~> 1.2.0"
  gem "capybara", "~> 2.2.1"
  gem "shoulda-matchers", "~> 2.5.0"
  gem "database_cleaner", "~> 1.2.0"
  gem "selenium-webdriver", "~> 2.40.0"
  gem 'launchy'
end

gem 'puma'