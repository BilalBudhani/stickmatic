lock '3.1.0'

set :application, 'stickmatic'
set :repo_url, 'git@github.com:BilalBudhani/stickmatic.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :deploy_to, '/home/deploy/stickmatic'
set :scm, :git
set :format, :pretty
set :log_level, :debug
set :pty, true
set :linked_files, %w{config/database.yml config/settings.local.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

set :rvm_ruby_version, '2.1.1'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

set :bundle_bins, fetch(:bundle_bins, []).push('rake')
set :bundle_roles, :all
set :bundle_binstubs, -> { shared_path.join('bin') }
set :bundle_gemfile, -> { release_path.join('Gemfile') }
set :bundle_dir, -> { shared_path.join('bundle') }
set :bundle_path, -> { shared_path.join('bundle') }
set :bundle_flags, '--deployment'
set :bundle_without, %w{development test}.join(' ')

## Hipchat inform
set :hipchat_token, "96e1eef8f2f3d6aeeb958bd4be2417"
set :hipchat_room_name, "development"

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :touch, release_path.join('tmp/restart.txt')
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

end
