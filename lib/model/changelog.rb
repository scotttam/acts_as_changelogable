class Changelog < ActiveRecord::Base
  belongs_to :user
  belongs_to :record, :polymorphic => true

  before_save :set_user
  after_save :record_history

  class << self
    def current_user=(user)
      @@current_user = user
    end
  end

  def current_user
    @@current_user
  end

  def commit_id
    changelogs_commit = ChangelogsCommit.find_all_by_changelog_id(self.id)
    changelogs_commit.empty? ? nil : changelogs_commit.first.commit.id
  end

  private

  def set_user
    self.user = @@current_user if self.class.class_variable_defined?(:@@current_user)
  end

  def record_history
    ChangelogSession.current_session.add_changelog_to_history(self)
  end
end
