class Commit < ActiveRecord::Base
  has_many :changelogs_commits
end
