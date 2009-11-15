module ActiveRecord
  module Acts
    module Changelogable
      module Rack
        class RecordChangelogs
          def initialize(app)
            @app = app
          end

          def call(env)
            ChangelogSession.begin
            status, header, response = @app.call(env)
            ChangelogSession.end
            return status, header, response
          end
        end
      end
    end
  end
end
