module Middlewares
  class AccessTokenMiddleware
    def initialize(app)
      @app = app
    end

    def call(env)
      request = ActionDispatch::Request.new(env)
      if request.path_info.start_with?('/sidekiq') || request.headers['token'] == 'my-secret-token'
        @app.call(env)
      else
        [401, {}, ['invalid or missing token']]
      end
    end
  end
end
