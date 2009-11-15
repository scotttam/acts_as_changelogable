require '../test_helper'

class CommitTest < ActiveSupport::TestCase
  test "it can be created" do
    assert Commit.create!
  end
end
