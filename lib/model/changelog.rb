module ActsAsChangelogable
  class Changelog < ActiveRecord::Base
    set_table_name "acts_as_changelogs"

    belongs_to :user
    belongs_to :record, :polymorphic => true

    before_save :set_user
    after_save :record

    class << self
      def current_user=(user)
        @@current_user = user
      end
    end

    def current_user
      @@current_user
    end

    private

    def set_user
      self.user = @@current_user if Changelog.class_variable_defined?(:@@current_user)
    end

    def record
      Session.current_session.add_changelog_to_history(self)
    end
  end
end
