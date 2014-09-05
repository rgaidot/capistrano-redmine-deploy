require 'dotenv'

Dotenv.load

lock '3.2.1'

set :pty, true

set :application, 'redmine'
set :repo_url, 'https://github.com/redmine/redmine.git'
set :scm, :git

set :branch, ENV['BRANCH']
set :deploy_to, ENV['DEPLOY_TO']
set :host, ENV['HOST']
set :user, ENV['USER']

set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}
set :keep_releases, 2

set :rvm_type, :user
set :rvm_ruby_version, "ruby-2.1@#{fetch(:application)}"

set :unicorn_worker_count, ENV['WORKER']

set :bundle_gemfile, shared_path.join('Gemfile.lock')

set(:config_files, %w(
  nginx.conf
  unicorn.rb
  unicorn_init.sh
))

set(:symlinks, [
  {
    source: 'nginx.conf',
    link: "/etc/nginx/sites-enabled/{{full_app_name}}"
  },
  {
    source: 'unicorn_init.sh',
    link: "/etc/init.d/unicorn_{{full_app_name}}"
  }
])

set(:executable_config_files, %w(
  unicorn_init.sh
))

namespace :deploy do
  after :publishing, :restart
  after :finishing, 'deploy:cleanup'
end
