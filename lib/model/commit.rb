class Commit < ActiveRecord::Base
  has_many :changelogs_commits
  has_many :changelogs, :through => :changelogs_commits

  def user_name

    #When a publisher is changed, I get nil.include? exception from changelogs.first.user.email.
    #However, if I reboot the server, the problem goes away. This is why I have this code here. Not sure what's
    #going on. TODO
    unless changelogs.empty?
      changelog = changelogs.first
      user = User.find_by_id(changelog.user_id)
      user ? user.email : nil
    end
  end
end
