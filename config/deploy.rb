# Gemfile.lockを見てcapistranoのバージョンを入れる
lock '3.14.0'

# 自身のアプリ名、リポジトリ名を記述
set :application, 'freemarket_sample_74a'
set :repo_url,  'git@github.com:lipton6904/freemarket_sample_74a.git'

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :rbenv_type, :user
set :rbenv_ruby, '2.5.1'

# chat-spaceで使ったpemを指定
set :ssh_options, auth_methods: ['publickey'],
                  keys: ['~/.ssh/deploytest.pem']

set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5


after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:stop'
    invoke 'unicorn:start'
  end

end