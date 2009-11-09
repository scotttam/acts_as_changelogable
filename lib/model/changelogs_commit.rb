module ActsAsChangelogable
  class ChangelogsCommit < ActiveRecord::Base
    set_table_name "acts_as_changelog_changelogs_commits"

    belongs_to :changelog
    belongs_to :commit
  end
end
