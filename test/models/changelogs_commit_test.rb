require '../test_helper'

class ActsAsChangelogable::ChangelogsCommitTest < ActiveSupport::TestCase
  test "it can be created" do
    assert ActsAsChangelogable::ChangelogsCommit.create!
  end
end
