class ChangelogsCommit < ActiveRecord::Base
  belongs_to :changelog
  belongs_to :commit
end
