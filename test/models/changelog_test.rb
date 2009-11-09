require '../test_helper'

class ChangelogTest < ActiveSupport::TestCase
  test "it can be created" do
    assert Changelog.new
  end
  
  test "it can assign a user object to the class" do
    Changelog.current_user = mock_user = "This is a mock current user"
    changelog = Changelog.new
    assert mock_user, changelog.current_user
  end
  
  test "it should set the current user before saving if the current_user is defined" do
    Changelog.current_user = mock_user = "This is a mock current user"
    changelog = Changelog.create!(:record_id => 1, :record_type => "Thingy", :user_id => 2,
                                  :diff => '{"something":["foo","bar"],"updated_at":["2007-07-01T00:20:11Z","2007-08-01T00:20:11Z"]}')
    assert_equal mock_user, changelog.user
  end
  
  test "it should not set the current user before saving if the current_user is not defined" do
    changelog = Changelog.create!(:record_id => 1, :record_type => "Thingy", :user_id => 2,
                                  :diff => '{"something":["foo","bar"],"updated_at":["2007-07-01T00:20:11Z","2007-08-01T00:20:11Z"]}')
    assert_equal nil, changelog.user
  end
  
  test "it should record into the session" do
    Session.any_instance.expects(:add_changelog_to_history)
    changelog = Changelog.create!(:record_id => 1, :record_type => "Thingy", :user_id => 2,
                                  :diff => '{"something":["foo","bar"],"updated_at":["2007-07-01T00:20:11Z","2007-08-01T00:20:11Z"]}')
  end
end