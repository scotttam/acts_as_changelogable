namespace :acts_as_changelogable do
  namespace :db do
    desc "Create the acts_as_changelogable migration file"
    task :create_migration_file => :environment do

      unless migration_file_exists?
        File.open(generate_migration_filename, "w") do |file|
          file.write "class CreateActsAsChangelogable < ActiveRecord::Migration"
          file.write "  def self.up"
          file.write "    create_table :acts_as_changelogs do |t|"
          file.write "      t.integer :record_id"
          file.write "      t.string :record_type"
          file.write "      t.integer :user_id"
          file.write "      t.string :operation"
          file.write "      t.text :diff"
          file.write "      t.string :description"
          file.write "      t.timestamps"
          file.write "    end"
          file.write "  end"
          file.write ""
          file.write "  def self.down"
          file.write "    drop_table :acts_as_changelogs"
          file.write "  end"
          file.write "end"
        end
      else
        puts "Appears the migration file already exists"
      end
    end
  end

  def generate_migration_filename
    "#{RAILS_ROOT}/db/migrate/#{Time.now.utc.strftime("%Y%m%d%H%M%S")}_create_acts_as_changelogable.rb"
  end

  def migration_file_exists?
    Dir.glob("#{RAILS_ROOT}/db/migrate/*").detect {|filename| filename =~ /\d{14}_create_acts_as_changelogable.rb/ }
  end
end
