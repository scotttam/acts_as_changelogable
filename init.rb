$:.unshift "#{File.dirname(__FILE__)}/lib"
require 'model/changelog'
require 'model/commit'
require 'model/changelogs_commit'
require 'model/session'
require 'active_record/acts/changelogable'
require 'active_record/acts/rack/record_changelogs'

ActiveRecord::Base.class_eval { include ActiveRecord::Acts::Changelogable }

ActionController::Dispatcher.middleware.use(ActiveRecord::Acts::Changelogable::Rack::RecordChangelogs)
