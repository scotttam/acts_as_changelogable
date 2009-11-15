require '../test_helper'

class ChangelogTest < ActiveSupport::TestCase
  setup do
    ChangelogSession.begin
    mock_user = User.find_by_email("nick@liftium.com")
    Changelog.current_user = mock_user
  end

  teardown do
    ChangelogSession.end
  end

  test "it can be created" do
    assert Changelog.new
  end

  test "it should set the current user before saving if the current_user is defined" do
    mock_user = User.find_by_email("nick@liftium.com")
    changelog = Changelog.create!(:record_id => 1, :record_type => "Thingy",
                                  :diff => '{"something":["foo","bar"],"updated_at":["2007-07-01T00:20:11Z","2007-08-01T00:20:11Z"]}')
    assert_equal mock_user, changelog.user
  end

  test "it should not set the current user before saving if the current_user is not defined" do
    Changelog.send(:remove_class_variable, :@@current_user)
    changelog = Changelog.create!(:record_id => 1, :record_type => "Thingy",
                                  :diff => '{"something":["foo","bar"],"updated_at":["2007-07-01T00:20:11Z","2007-08-01T00:20:11Z"]}')
    assert_equal nil, changelog.user_id
  end

  test "it should record into the ChangelogSession" do
    ChangelogSession.any_instance.expects(:add_changelog_to_history)
    changelog = Changelog.create!(:record_id => 1, :record_type => "Thingy", :user_id => 2,
                                  :diff => '{"something":["foo","bar"],"updated_at":["2007-07-01T00:20:11Z","2007-08-01T00:20:11Z"]}')
  end
end
