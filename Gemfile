source 'https://rubygems.org'

gem 'rails', '4.2.0'
gem 'haml-rails'
gem 'devise'
#gem 'kramdown'
gem 'github-markdown', require: 'github/markdown'
gem 'mysql2', group: :production
gem 'pg', group: :production
gem 'smart_aleck'

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'therubyracer', platforms: :ruby
gem 'bourbon'
gem 'neat'
gem 'bitters'

gem 'jquery-rails'
#gem 'turbolinks'

gem 'unicorn'

group :production do
  gem 'rails_12factor'
end

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'spring'
  gem 'dotenv-rails'
  gem 'gitnesse'
end

group :test do
  gem 'poltergeist'
  gem 'capybara'
  gem 'cucumber-rails', require: false
  gem 'simplecov', require: false
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'faker'
  gem 'factis'
end
