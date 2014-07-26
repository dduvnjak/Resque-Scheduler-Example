# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'Resque-Scheduler-Example'
set :repo_url, 'https://github.com/dduvnjak/Resque-Scheduler-Example'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/home/vagrant/Resque-Scheduler-Example'

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')

      sudo "/etc/init.d/nginx reload"
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after 'deploy:restart', 'unicorn:reload'    # app IS NOT preloaded
  after 'deploy:restart', 'unicorn:restart'   # app preloaded
  after 'deploy:restart', 'unicorn:duplicate' # before_fork hook implemented (zero downtime deployments)

end

## resque
role :resque_worker, "localhost"
role :resque_scheduler, "localhost"

# queue name and number of workers
set :workers, { "example_queue" => 2 }

# We default to storing PID files in a tmp/pids folder in your shared path, but
# you can customize it here (make sure to use a full path). The path will be
# created before starting workers if it doesn't already exist.
# set :resque_pid_path, -> { File.join(shared_path, 'tmp', 'pids') }

# Uncomment this line if your workers need access to the Rails environment:
# set :resque_environment_task, true
#You can also specify multiple queues and the number of workers for each queue:

#set :workers, { "archive" => 1, "mailing" => 3, "search_index, cache_warming" => 1 }