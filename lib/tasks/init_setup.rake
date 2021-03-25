task init_setup: :environment do
  bundle exec rails generate rspec:install
  Rake::Task["db:create"].invoke
  bundle exec rails g annotate:install
end
