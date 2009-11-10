require '../test_helper'

class ActsAsChangelogable::CommitTest < ActiveSupport::TestCase
  test "it can be created" do
    assert ActsAsChangelogable::Commit.create!
  end
end
