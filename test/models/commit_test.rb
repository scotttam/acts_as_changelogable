require '../test_helper'

class CommitTest < ActiveSupport::TestCase
  test "it can be created" do
    assert Commit.create!
  end

  test "it can get the user_name" do
    commit = Commit.create!
    user = User.find(:first)
    commit.stubs(:changelogs).returns([Changelog.new(:user_id => user.id)])
    User.expects(:find_by_id).with(user.id).returns(user)
    assert_equal user.email, commit.user_name
  end
end
