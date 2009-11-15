require '../test_helper'

class ChangelogsCommitTest < ActiveSupport::TestCase
  test "it can be created" do
    assert ChangelogsCommit.create!(:changelog_id => 1, :commit_id => 1)
  end
end
