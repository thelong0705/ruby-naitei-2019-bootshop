source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "font-awesome-rails"
gem "puma", "~> 3.7"
gem "rails", "~> 5.1.7"
gem "rubocop", "~> 0.54.0", require: false
gem "sass-rails", "~> 5.0"
gem "sqlite3"
gem "uglifier", ">= 1.3.0"

gem "coffee-rails", "~> 4.2"
gem "config"
gem "config"
gem "devise"
gem "devise-i18n"
gem "jbuilder", "~> 2.5"
gem "sidekiq"
gem "simplecov", require: false, group: :test
gem "turbolinks", "~> 5"
# gem 'redis', '~> 4.0'
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "rspec-rails", "~> 3.8"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
