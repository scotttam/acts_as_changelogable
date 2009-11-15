class ChangelogSession
  attr_reader :user

  def initialize
    @changelogs = []
  end

  def add_changelog_to_history(changelog)
    @changelogs << changelog
  end

  def record
    return if @changelogs.empty?
    commit = Commit.create

    @changelogs.each do |changelog|
      ChangelogsCommit.create(:changelog_id => changelog.id, :commit_id => commit.id)
    end

    @changelogs = nil
  end

  class << self
    def begin
      @@current_session ||= ChangelogSession.new
    end

    def end
      @@current_session.record
      @@current_session = nil
    end

    def current_session
      @@current_session
    end
  end
end
