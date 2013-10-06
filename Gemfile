source 'https://rubygems.org'

gem 'rails', '~> 4.0.0.rc1'
gem 'jquery-rails'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mysql2', platforms: :ruby
gem 'activerecord-jdbcmysql-adapter', platforms: :jruby
gem 'jruby-openssl', platforms: :jruby
gem 'actionpack-page_caching'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '~> 4.0.0.rc1'

  gem 'uglifier'
  gem 'anjlab-bootstrap-rails', require: 'bootstrap-rails'

  gem 'therubyrhino', platforms: :jruby
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

group :standalone do
  # Use unicorn as the app server
  gem 'unicorn', platforms: :mri
  gem 'puma', platforms: [:rbx, :jruby]
end

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

group :newrelic do
  gem 'newrelic_rpm'
end

group :development do
  gem 'quiet_assets'
  gem 'puma'
end
