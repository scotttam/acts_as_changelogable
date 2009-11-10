require '../test_helper'

class ActsAsChangelogable::ChangelogsCommitTest < ActiveSupport::TestCase
  test "it can be created" do
    assert ActsAsChangelogable::ChangelogsCommit.create!(:changelog_id => 1, :commit_id => 1)
  end
end
