# config valid only for current version of Capistrano
lock '3.6.0'

set :application, 'graduation'

set :repo_url, 'https://github.com/KakeruYamamoto/graduation.git'

# バージョンが変わっても共通で参照するディレクトリを指定
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :branch, ENV['BRANCH'] || 'master'

set :deploy_to, '/var/www/graduation'

#追加
set :linked_files, fetch(:linked_files, []).push("config/master.key")
# set :linked_files, %w{.env config/secrets.yml}

set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets public/uploads}

set :keep_releases, 5

set :rbenv_ruby, '2.6.5'
set :rbenv_type, :system

# どの公開鍵を利用してデプロイするか
set :ssh_options, auth_methods: ['publickey'],
                  keys: ['~/.ssh/achieve-key2.pem']

# プロセス番号を記載したファイルの場所
set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }

# Unicornの設定ファイルの場所
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5



set :log_level, :debug
# set :log_level, :info




# デプロイ処理が終わった後、Unicornを再起動するための記述
after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end

  desc 'upload master.key'#ここ注意
  task :upload do
    on roles(:app) do |host|
      if test "[ ! -d #{shared_path}/config ]"
        execute "mkdir -p #{shared_path}/config"
      end
      upload!('config/master.key', "#{shared_path}/config/master.key")#ここ注意
    end
  end
  before :starting, 'deploy:upload'
  after :finishing, 'deploy:cleanup'
end

set :default_env, {
  rbenv_root: "/usr/local/rbenv",
  path: "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH",
  AWS_ACCESS_KEY_ID: ENV["AWS_ACCESS_KEY_ID"],
  AWS_SECRET_ACCESS_KEY: ENV["AWS_SECRET_ACCESS_KEY"]
}
