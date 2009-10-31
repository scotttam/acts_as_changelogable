namespace :acts_as_changelogable do
  namespace :db do
    desc "Migration to create the acts_as_changelogable table if it doesn't already exist"
    task :migrate => :environment do
      config = YAML::load(IO.read("#{RAILS_ROOT}/config/database.yml"))
      ActiveRecord::Base.establish_connection(config[RAILS_ENV])
      load(File.dirname(__FILE__) + "/../lib/db/migrate/create_acts_as_changelogable.rb")
    end
  end
end

