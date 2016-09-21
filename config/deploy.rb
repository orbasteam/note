# config valid only for current version of Capistrano
lock '>= 3.6.0'

# RailsConfig.load_and_set_settings('config/settings.local.yml')

set :application, 'note'
set :repo_url, fetch(:repo_url)
set :scm, :git
set :keep_releases, 5

set :linked_files, %w{config/secrets.yml config/database.yml config/settings/production.yml}
set :passenger_restart_with_touch, true

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  desc 'DB migrate'
  task :db_migrate do
    on roles(:web) do
      within "#{release_path}" do
        execute 'rake', 'db:migrate', "RAILS_ENV=#{fetch(:stage)}"
      end
    end
  end

  desc 'Restart application'
  task :restart_passenger do
    on roles(:web), in: :sequence, wait: 5 do
      within release_path do
        execute :touch, 'tmp/restart.txt'
      end
    end
  end
end

after :deploy, "deploy:db_migrate"
after :deploy, 'deploy:restart_passenger'