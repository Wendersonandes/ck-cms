source "https://rubygems.org"

gem "rails", "4.2.6"
gem "pg"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.1.0"
gem "jquery-rails"

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem "turbolinks"

# CMS for rails
gem "camaleon_cms"

group :development do
  gem "rubocop", require: false
  gem "brakeman", require: false
  gem "quiet_assets"
  gem "letter_opener"
  gem "bullet"
  gem "web-console", "~> 2.0"
  gem "rack-mini-profiler"
end

group :development, :test do
  gem "pry"
  gem "pry-byebug"
  gem "awesome_print", require: "ap"
  gem "rspec-rails", "~> 3.4"
  # gem "httplog" # Note: uncomment and bundle to see api calls, if needed.
end

group :test do
  gem "factory_girl_rails"
  gem "mocha"
  gem "database_cleaner"
  gem "timecop"
  gem "capybara-webkit"
  gem "selenium-webdriver"
  gem "simplecov", require: false
  gem "launchy"
  # gem "webmock"
end

# Capistrano Deployment
group :development, :deployment do
  gem "capistrano", "3.4.0", require: false # Deploy is locked to this version
  gem "capistrano-rails", "~> 1.1.3", require: false
  gem "capistrano-rvm", require: false
  gem "capistrano-faster-assets", "~> 1.0", require: false
  gem "capistrano-db-tasks", "~> 0.4", require: false
end

#################### Camaleon CMS include all gems for plugins and themes ####################
require "./lib/plugin_routes"
instance_eval(PluginRoutes.draw_gems)
