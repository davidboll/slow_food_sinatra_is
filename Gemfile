source 'https://rubygems.org'

ruby '2.4.1'

# PostgreSQL driver
gem 'pg'

# Sinatra driver
gem 'sinatra'
gem 'sinatra-contrib'
gem 'sinatra-flash'
gem 'sinatra-redirect-with-flash'

gem 'activerecord'
gem 'activesupport'
gem 'bcrypt'

gem 'rake'

gem 'shotgun'

group :test do
  gem 'capybara'
  gem 'database_cleaner', '~> 1.4.1'
  gem 'launchy'
  gem 'rack-test'
  gem 'rspec'
  gem 'shoulda-matchers'
end

group :test, :development do
  gem 'factory_bot'
  gem 'cucumber', '~> 2.4'
  gem 'pry-byebug'
  gem 'timecop'
end
