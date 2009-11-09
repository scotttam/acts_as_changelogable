module ActsAsChangelogable
  class Commit < ActiveRecord::Base
    set_table_name "acts_as_changelog_commits"

    has_many :changelogs_commits
  end
end
