require "rvm/capistrano"
require "bundler/capistrano"

set :application, "zven_kedr"
set :repository,  "git@github.com:ilisun/zven_kedr.git"

set :shared_children, shared_children
set :deploy_to, "/var/www/zven_kedr"
set :scm, :git
set :branch, "master"
set :user, "ulip"
set :group, "ulip"
set :use_sudo, false
set :rails_env, "production"
set :deploy_via, :copy
set :ssh_options, { :forward_agent => true, :port => 2008 }
set :keep_releases, 5
default_run_options[:pty] = true
server "188.166.27.58", :app, :web, :db, :primary => true

after "deploy", "deploy:cleanup"

namespace :deploy do
  %w[start stop restart].each do |command|
    desc "#{command} unicorn server"
    task command, roles: :app, except: {no_release: true} do
      run "/etc/init.d/unicorn_#{application} #{command}"
    end
  end

  task :setup_config, roles: :app do
    sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
    sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
    run "mkdir -p #{shared_path}/config"
    put File.read("config/production_database.yml"), "#{shared_path}/config/database.yml"
    puts "Теперь вы можете отредактировать файлы в  #{shared_path}."
  end
  after "deploy:setup", "deploy:setup_config"

  task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  after "deploy:finalize_update", "deploy:symlink_config"

  desc "Make sure local git is in sync with remote."
  task :check_revision, roles: :web do
    unless `git rev-parse HEAD` == `git rev-parse origin/master`
      puts "WARNING: HEAD is not the same as origin/master"
      puts "Run `git push` to sync changes."
      exit
    end
  end
  before "deploy", "deploy:check_revision"

end