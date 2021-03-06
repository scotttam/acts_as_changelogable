namespace :acts_as_changelogable do
  namespace :db do
    desc "Create the acts_as_changelogable migration file"
    task :create_migration_file => :environment do

      unless migration_file_exists?
        File.open(generate_migration_filename, "w") do |file|
          file.puts "class CreateActsAsChangelogable < ActiveRecord::Migration"
          file.puts "  def self.up"
          file.puts "    create_table :changelogs do |t|"
          file.puts "      t.integer :record_id"
          file.puts "      t.string :record_type"
          file.puts "      t.integer :user_id"
          file.puts "      t.string :operation"
          file.puts "      t.text :diff"
          file.puts "      t.string :description"
          file.puts "      t.timestamps"
          file.puts "    end"
          file.puts ""
          file.puts "    add_index :changelogs, :record_id"
          file.puts "    add_index :changelogs, :user_id"
          file.puts ""
          file.puts "    create_table :commits do |t|"
          file.puts "      t.timestamps"
          file.puts "    end"
          file.puts ""
          file.puts "    create_table :changelogs_commits do |t|"
          file.puts "      t.integer :changelog_id"
          file.puts "      t.integer :commit_id"
          file.puts "      t.timestamps"
          file.puts "    end"
          file.puts ""
          file.puts "    add_index :changelogs_commits, :changelog_id"
          file.puts "    add_index :changelogs_commits, :commit_id"
          file.puts "  end"
          file.puts ""
          file.puts "  def self.down"
          file.puts "    drop_table :changelogs"
          file.puts "    drop_table :commits"
          file.puts "    drop_table :changelogs_commits"
          file.puts "  end"
          file.puts "end"
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
