source 'https://rubygems.org'
ruby "2.5.1"

gem 'rails', '4.2.11.1'
gem 'haml-rails'
gem 'devise'
gem 'github-markdown', require: 'github/markdown'
gem 'mysql2', group: :production
gem 'pg', '~> 0.21.0', group: :production
gem 'smart_aleck', '~> 0.1'

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'bourbon', '= 4.2.0'
gem 'neat', '= 1.7.1'
gem 'bitters', '1.0.0'
gem 'best_in_place', '~> 3.0.1'
gem 'jquery-rails'

gem 'unicorn'

group :production do
  gem 'rails_12factor'
end

group :development, :test do
  gem 'sqlite3', '= 1.3.10'
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
