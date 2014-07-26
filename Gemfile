source 'https://rubygems.org'

gem 'rails', '3.2.1'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'

gem 'unicorn'
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end

gem 'redis', '2.2.2'

gem 'jquery-rails'

# Job Scheduling
gem 'resque' # background jobs
gem 'resque-scheduler', '2.0.1' # job scheduling

group :development do
  gem 'capistrano', '~> 3.1.0'
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano-bundler', '~> 1.1.2'
  gem 'capistrano-unicorn', require: false, github: 'inbeom/capistrano-unicorn', branch: 'capistrano3'
  gem 'capistrano-rvm'
  gem "capistrano-resque", "~> 0.2.0", require: false
end
